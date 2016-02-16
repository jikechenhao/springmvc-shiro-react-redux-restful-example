import ActionTypes from 'js/constants/constants';
import Base64 from 'js/util/Base64';
import { history } from 'js/routes/routeUtil';
import { request401Resend, clearRequest401List, getRequest401ListLength } from '../util/http';

export function loadUserInfo() {
    return dispatch => dispatch({
        type: ActionTypes.LOAD_USER_INFO,
        payload: {
            userInfo: JSON.parse(localStorage.getItem('userInfo') || '{}'),
            logined: JSON.parse(localStorage.getItem('logined') || 'false')
        }
    });
}

export function login(account, password) {
    return (dispatch, getState) => dispatch({
        type: [, ActionTypes.CLOSE_MODAL, ActionTypes.LOGIN_FAILURE],
        req: {
            method: 'post',
            url: '/login.json',
            param: {
                authc: (new Base64).encode(account + ':' + password),
            }
        },
        onSuccess: payload => {
            localStorage.setItem('userInfo', JSON.stringify(payload.entity));
            localStorage.setItem('logined', JSON.stringify(true));
            const userState = getState().user;
            //有两种登陆情况
            //1: 在登录页面登陆
            //2: 在发出某次请求后身份验证失败导致弹出登陆框, 此时(也仅有此时会)将失败的请求添加到request401List中
            //   登陆成功后判断再次登陆的角色和当前所在页面所需角色身份是否一致
            //所以request401List.length为0时说明肯定不是第二种情况, 此时直接跳转到登陆角色的首页
            //当登陆后的角色和登陆前的角色根url不一致时清空请求, 跳转到新登陆角色的首页
            dispatch({
                type: ActionTypes.LOGIN_SUCCESS,
                payload: payload
            });
            if (
                0 === getRequest401ListLength() || !userState.userInfo.roleList ||
                userState.userInfo.roleList[0].url !== payload.entity.roleList[0].url
            ) {
                clearRequest401List();
                history.get().push(payload.entity.roleList[0].url);
            } else {
                request401Resend();
            }
        },
        onFailure: (err, res) => {
            localStorage.removeItem('userInfo');
            localStorage.removeItem('logined');
            localStorage.removeItem('token');
        }
    });
}

export function logout() {
    return dispatch => {
        localStorage.removeItem('userInfo');
        localStorage.removeItem('logined');
        localStorage.removeItem('token');
        dispatch({
            type: ActionTypes.LOGOUT
        });
        history.get().push('/');
    }
}

export function createDeletePwd(account, password) {
    return dispatch => dispatch({
        type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.CREATE_DELETE_PWD]],
        req: {
            method: 'create',
            url: '/user/create.json',
            param: {info: (new Base64).encode(account + ':' + password)}
        }
    });
}

export function updateDeletePwd(account, password, newPassword) {
    return dispatch => dispatch({
        type: [, ActionTypes.CLOSE_MODAL],
        req: {
            method: 'update',
            url: '/user/update.json',
            param: {
                oldInfo: (new Base64).encode(account + ':' + password),
                newInfo: (new Base64).encode(account + ':' + newPassword)
            }
        }
    });
}
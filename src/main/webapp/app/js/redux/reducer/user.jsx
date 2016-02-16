import ActionTypes from 'js/constants/constants';

const initialState = {
    userInfo: {},
    logined: false
};

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.LOAD_USER_INFO:
            return payload;
        case ActionTypes.LOGIN_SUCCESS:
            return {
                userInfo: payload.entity,
                logined: true
            };
        case ActionTypes.LOGIN_FAILURE:
            return {...state, logined: false};
        case ActionTypes.LOGOUT:
            return {
                userInfo: {},
                logined: false
            };
        case ActionTypes.CREATE_DELETE_PWD:
            const newState = {...state};
            newState.userInfo.existedDeletePwd = true;
            return newState;
        default:
            return state;
    }
}


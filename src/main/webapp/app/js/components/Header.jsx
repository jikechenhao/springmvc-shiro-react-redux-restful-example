import React from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router';

import { logout } from 'js/redux/actions/user';
import { showModal, toggleImgShow } from 'js/redux/actions/container';

import CreatePwdModal from 'js/routes/Admin/components/CreatePwdModal';
import UpdatePwdModal from 'js/routes/Admin/components/UpdatePwdModal';

import { getColClass } from 'js/util/styleUtil';

import 'css/header.css';

class Header extends React.Component {
    render() {
        const { navList, dispatch, user } = this.props;
        const nav = [];
        if (navList) {
            navList.forEach((item, index) => {
                nav.push(
                    <li key = {item.path + index}>
                        <Link to = {item.path}>{item.title}</Link>
                    </li>
                );
            });
        }

        return (
            <div className = {getColClass(20, 20, 'nav')}>
                <ol className = 'breadcrumb pull-left'>
                    当前位置:&nbsp;&nbsp;
                    {nav}
                </ol>
                <button className = 'btn btn-primary pull-right' onClick = {() => dispatch(logout())}>退出</button>
                <label
                    className = 'hidden-sm hidden-xs pull-right'
                    style = {{lineHeight: '40px', fontSize: '16px', color: '#fff', margin: '0 10px'}}
                    >
                    {user.userInfo.name}
                </label>
                {
                    user.userInfo.roleList && 'admin' === user.userInfo.roleList[0].role ?
                        (
                            user.userInfo.existedDeletePwd ?
                                <button
                                    className = 'btn btn-primary pull-right'
                                    onClick = {() => dispatch(showModal(<UpdatePwdModal />))}
                                    >
                                    修改删除密码</button> :
                                <button
                                    className = 'btn btn-primary pull-right'
                                    onClick = {() => dispatch(showModal(<CreatePwdModal />))}
                                    >
                                    设置删除密码</button>
                        ) : null
                }
                <button
                    className = 'btn btn-primary pull-right'
                    onClick = {() => dispatch(toggleImgShow())}
                    >
                    {this.props.showImg ? '隐藏' : '显示'}图片
                </button>
            </div>
        );
    }
}

export default connect(state => ({user: state.user, navList: state.container.navList}))(Header);
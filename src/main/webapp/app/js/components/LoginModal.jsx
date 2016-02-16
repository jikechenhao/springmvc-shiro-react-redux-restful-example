import React from 'react';
import { connect } from 'react-redux';

import { login } from 'js/redux/actions/user';
import { closeModal } from 'js/redux/actions/container';

import TextInput from 'js/components/validation/TextInput';
import Modal from 'js/components/common/Modal';

class LoginModal extends React.Component {
    constructor(props) {
        super(props);
        this.formStyle = {
            maxWidth: 330 + 'px',
            padding: 15 + 'px',
            margin: '0 auto'
        };
    }

    render() {
        const dispatch = this.props.dispatch;
        return (
            <Modal
                title = '请登陆'
                titleStyle = {{textAlign: 'center'}}
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {(event) => dispatch(login(event.target.account.value, event.target.password.value))}
                >
                <div className = 'container-fluid' style = {this.formStyle}>
                    <label>请输入账号:</label>

                    <div>
                        <TextInput
                            name = 'account'
                            placeholder = '请输入账号'
                            emptyMsg = '请输入账号'
                            outRangeMsg = '账号最多为15个字符'
                            maxLength = '15'
                            required
                            autofocus
                            />
                    </div>
                    <label>请输入密码:</label>

                    <div>
                        <TextInput
                            name = 'password'
                            type = 'password'
                            placeholder = '请输入密码'
                            emptyMsg = '请输入密码'
                            outRangeMsg = '密码最多为15个字符'
                            maxLength = '15'
                            required
                            />
                    </div>
                </div>
            </Modal>
        );
    }
}

export default connect(state => ({}))(LoginModal);
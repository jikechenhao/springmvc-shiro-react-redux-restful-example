import React from 'react'
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as UserActions from 'js/redux/actions/user';
import Form from 'js/components/validation/Form';
import TextInput from 'js/components/validation/TextInput';

class LoginForm extends React.Component {
    render() {
        var formStyle = {
            maxWidth: 330 + 'px',
            padding: 15 + 'px',
            margin: '0 auto'
        };

        const { dispatch } = this.props;
        const actions = bindActionCreators(UserActions, dispatch);
        return (
            <div className = 'container-fluid' style = {formStyle}>
                <Form
                    onSubmit = {(event =>actions.login(event.target.account.value, event.target.password.value))}
                    preventDefault = {true}
                    >
                    <h2>请登陆</h2>

                    <div className = 'form-group'>
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
                    </div>
                    <div className = 'form-group'>
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
                    <button className = 'btn btn-lg btn-primary btn-block' type = 'submit'>登陆</button>
                </Form>
            </div>
        )
    }
}

export default connect(state => ({}))(LoginForm);

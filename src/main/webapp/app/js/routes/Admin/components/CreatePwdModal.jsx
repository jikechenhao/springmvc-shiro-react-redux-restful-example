import React from 'react';
import { connect } from 'react-redux';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

import { createDeletePwd } from 'js/redux/actions/user';
import { closeModal, showMessage } from 'js/redux/actions/container';

import Modal from 'js/components/common/Modal';
import TextInput from 'js/components/validation/TextInput';

class CreatePwdModal extends React.Component {
    handleFormSubmit(event) {
        const { newPassword1, newPassword2 } = event.target;
        if (newPassword1.value.trim() !== newPassword2.value.trim()) {
            this.props.dispatch(showMessage('两次新密码不一致', false));
        } else {
            this.props.dispatch(createDeletePwd('_delete_', newPassword1.value.trim()));
        }
    }

    render() {
        const { dispatch } = this.props;
        return (
            <Modal
                title = '修改删除密码'
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {this.handleFormSubmit.bind(this)}>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>删除密码:</label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            type = 'password'
                            name = 'newPassword1'
                            placeholder = '请输入删除密码'
                            emptyMsg = '请输入删除密码'
                            outRangeMsg = '删除密码最多为15个字符'
                            maxLength = '15'
                            required
                            />
                    </div>
                </div>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>删除密码:</label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            type = 'password'
                            name = 'newPassword2'
                            placeholder = '请再次输入删除密码'
                            emptyMsg = '请再次输入删除密码'
                            outRangeMsg = '删除密码最多为15个字符'
                            maxLength = '15'
                            required
                            />
                    </div>
                </div>
            </Modal>
        );
    }
}

export default connect(state => ({}))(CreatePwdModal);
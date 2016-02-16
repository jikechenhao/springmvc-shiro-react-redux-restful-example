import React from 'react';
import { connect} from 'react-redux';

import { closeModal } from 'js/redux/actions/container';

import TextInput from 'js/components/validation/TextInput';
import Modal from 'js/components/common/Modal';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class DeleteModal extends React.Component {
    render() {
        const { dispatch, onFormSubmit, target, body } = this.props;
        return (
            <Modal
                title = {this.props.title}
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {event => onFormSubmit(event, target)}
                >
                {
                    body ? body :
                        (
                            <div className = 'form-group'>
                                <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                                    删除密码:
                                </label>
                                <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                                    <TextInput
                                        type = 'password'
                                        name = 'deletePwd'
                                        placeholder = '请输入删除密码'
                                        emptyMsg = '请输入删除密码'
                                        outRangeMsg = '删除密码最多为45个字符'
                                        maxLength = '45'
                                        required
                                        />
                                </div>
                            </div>
                        )
                }
            </Modal>
        )
    }
}

export default connect(state => ({}))(DeleteModal);
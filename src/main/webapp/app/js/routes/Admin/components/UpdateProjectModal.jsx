import React from 'react';
import { connect } from 'react-redux';

import { updateProject } from 'js/redux/actions/project';
import { closeModal, showMessage } from 'js/redux/actions/container';

import TextInput from 'js/components/validation/TextInput';
import Modal from 'js/components/common/Modal';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class UpdateProjectModal extends React.Component {
    render() {
        const { dispatch, target, title } = this.props;
        return (
            <Modal
                title = {'修改项目: ' + target.projectName}
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {(event) => dispatch(updateProject(event.target, target))}
                >
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>项目名字:</label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            name = 'projectName'
                            defaultValue = {target.projectName}
                            placeholder = '请输入项目名字'
                            emptyMsg = '请输入项目名'
                            outRangeMsg = '项目名最多为45个字符'
                            maxLength = '45'
                            required
                            />
                    </div>
                </div>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>合同编号:</label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            name = 'contractNO'
                            defaultValue = {target.contractNO}
                            placeholder = '请输入合同编号'
                            emptyMsg = '请输入合同编号'
                            outRangeMsg = '合同编号最多为45个字符'
                            maxLength = '45'
                            required
                            />
                    </div>
                </div>
            </Modal>
        );
    }
}

export default connect(state => ({}))(UpdateProjectModal);
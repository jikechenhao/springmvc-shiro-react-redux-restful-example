import React from 'react';
import { connect } from 'react-redux';

import { updateModule } from 'js/redux/actions/module';
import { closeModal } from 'js/redux/actions/container';

import TextInput from 'js/components/validation/TextInput';
import Modal from 'js/components/common/Modal';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class UpdateModuleModal extends React.Component {
    render() {
        const { dispatch, target } = this.props;
        return (
            <Modal
                title = {'修改模块: ' + target.moduleName}
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {event => dispatch(updateModule(event.target, target))}>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        模块名:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            name = 'moduleName'
                            defaultValue = {target.moduleName}
                            placeholder = '请输入模块名'
                            maxLength = '45'
                            required
                            />
                    </div>
                </div>
            </Modal>
        );
    }
}

export default connect(state => ({}))(UpdateModuleModal);
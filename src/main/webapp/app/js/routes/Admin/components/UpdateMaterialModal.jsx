import React from 'react';
import { connect } from 'react-redux';

import { updateMaterial }from 'js/redux/actions/material';
import { closeModal } from 'js/redux/actions/container';

import TextInput from 'js/components/validation/TextInput';
import Modal from 'js/components/common/Modal';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class UpdateMaterialModal extends React.Component {
    render() {
        const { dispatch, target } = this.props;
        return (
            <Modal
                title = {'修改材料: ' + target.materialName}
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {event => dispatch(updateMaterial(event.target, target))}>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        材料名:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            name = 'materialName'
                            defaultValue = {target.materialName}
                            placeholder = '请输入材料名'
                            emptyMsg = '请输入材料名'
                            outRangeMsg = '材料名最多为45个字符'
                            maxLength = '45'
                            required
                            />
                    </div>
                </div>
            </Modal>
        );
    }
}

export default connect(state => ({}))(UpdateMaterialModal);
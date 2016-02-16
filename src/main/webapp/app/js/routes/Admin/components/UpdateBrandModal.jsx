import React from 'react';
import { connect } from 'react-redux';

import { updateBrand } from 'js/redux/actions/brand';
import { closeModal } from 'js/redux/actions/container';

import TextInput from 'js/components/validation/TextInput'
import Modal from 'js/components/common/Modal';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class UpdateModuleModal extends React.Component {
    render() {
        const { dispatch, target } = this.props;
        return (
            <Modal
                title = {'修改品牌: ' + target.brandName}
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {event => dispatch(updateBrand(event.target, this.props.target))}>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        品牌名:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            name = 'brandName'
                            defaultValue = {this.props.target.brandName}
                            placeholder = '请输入品牌名'
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
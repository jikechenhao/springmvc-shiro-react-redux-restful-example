import React from 'react';
import { connect } from 'react-redux';

import { updateSp } from 'js/redux/actions/sp';
import { closeModal } from 'js/redux/actions/container';

import TextInput from 'js/components/validation/TextInput';
import IntInput from 'js/components/validation/IntInput';
import Modal from 'js/components/common/Modal';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class UpdateSpModal extends React.Component {
    render() {
        const { dispatch, target } = this.props;
        return (
            <Modal
                title = {'修改规格型号: ' + target.spName}
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {event => dispatch(updateSp(event.target, target))}>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        规格型号:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            name = 'spName'
                            defaultValue = {target.spName}
                            placeholder = '请输入规格型号'
                            emptyMsg = '请输入规格型号'
                            outRangeMsg = '规格型号最多为1200个字符'
                            maxLength = '1200'
                            required
                            />
                    </div>
                </div>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        单位:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            name = 'unit'
                            defaultValue = {target.unit}
                            placeholder = '请输入单位'
                            emptyMsg = '请输入单位'
                            outRangeMsg = '单位最多为20个字符'
                            maxLength = '20'
                            required
                            />
                    </div>
                </div>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        合同数量:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <IntInput
                            name = 'contractAmount'
                            defaultValue = {target.contractAmount}
                            placeholder = '请输入合同上该型号数量'
                            notIntMsg = '请输入纯数字'
                            emptyMsg = '请输入合同数量'
                            outMaxRangeMsg = '这个数量是不是太大了..'
                            outMinRangeMsg = '请输入不小于0的数量'
                            max = {999999}
                            min = {0}
                            required
                            />
                    </div>
                </div>
            </Modal>
        );
    }
}

export default connect(state => ({}))(UpdateSpModal);
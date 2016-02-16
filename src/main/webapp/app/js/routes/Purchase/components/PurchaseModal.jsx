import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { putPurchase } from 'js/redux/actions/purchase';
import { closeModal } from 'js/redux/actions/container';

import FloatInput from 'js/components/validation/FloatInput';
import IntInput from 'js/components/validation/IntInput';
import TextInput from 'js/components/validation/TextInput';
import Modal from 'js/components/common/Modal';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class PurchaseModal extends React.Component {
    render() {
        const { dispatch, target } = this.props;
        return (
            <Modal
                title = {
                <span>
                    <h4 className = 'modal-title'>添加采购</h4>
                    <h5 className = 'modal-title'>材料名称:<small>{target.materialName}</small></h5>
                    <h5 className = 'modal-title'>规格型号:<small>{target.spName}</small></h5>
                </span>
                }
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {event => dispatch(putPurchase(target, event.target))}
                >
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        单价:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <FloatInput
                            name = 'unitPrice'
                            placeholder = '请输入单价'
                            notFloatMsg = '请在此处输入数值型数据'
                            emptyMsg = '请输入单价'
                            outMaxRangeMsg = '这个数字是不是太大了...'
                            outMinRangeMsg = '最小0'
                            max = {999999999.0}
                            min = {0}
                            required
                            />
                    </div>
                </div>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        数量:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <IntInput
                            name = 'purchaseAmount'
                            placeholder = '请输入采购数量'
                            notIntMsg = '请输入纯数字'
                            emptyMsg = '请输入采购数量'
                            outMaxRangeMsg = '这个数量是不是太大了..'
                            outMinRangeMsg = '请输入不小于0的数量'
                            max = {999999}
                            min = {0}
                            required
                            />
                    </div>
                </div>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        金额:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <FloatInput
                            name = 'totalCost'
                            placeholder = '请输入总花费金额'
                            notFloatMsg = '请在此处输入数值型数据'
                            emptyMsg = '请输入总花费金额'
                            outMaxRangeMsg = '这个数字是不是太大了...'
                            outMinRangeMsg = '最小0'
                            max = {999999999.0}
                            min = {0}
                            required
                            />
                    </div>
                </div>
                <div className = 'form-group'>
                    <label className = {getColClass(4, 4, getOffsetClass(2, 2, 'control-label'))}>
                        供应商:
                    </label>

                    <div className = {getColClass(9, 9, getOffsetClass(1, 1))}>
                        <TextInput
                            name = 'supplier'
                            placeholder = '请输入供应商'
                            emptyMsg = '请输入供应商'
                            outRangeMsg = '供应商最多为45个字符'
                            maxLength = '45'
                            required
                            />
                    </div>
                </div>
            </Modal>
        );
    }
}

export default connect(state => ({}))(PurchaseModal);
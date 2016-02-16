import React from 'react';
import { connect } from 'react-redux';

import { closeModal } from 'js/redux/actions/container';
import { queryArrived, updateArrived } from 'js/redux/actions/arrived';

import IntInput from 'js/components/validation/IntInput';
import Modal from 'js/components/common/Modal';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class ArrivedModal extends React.Component {
    componentDidMount() {
        this.props.dispatch(queryArrived(this.props.target.applyId));
    }

    render() {
        const arrivedRowList = [];
        const { dispatch, arrivedList, target, module } = this.props;
        let confirmable = false;
        arrivedList.forEach((item, index) => {
            confirmable = !item.confirmed;
            arrivedRowList.push(
                <tr key = {index}
                    className = {item.confirmed ? 'success' : (0 != item.arrivedAmount ? 'warning' : null)}
                    >
                    <td>{item.confirmed ? '已确认' : '未确认'}</td>
                    <td>
                        {
                            item.confirmed ?
                                item.arrivedAmount :
                                (
                                    <div className = 'form-group'>
                                        <div className = {getColClass(14, 14, getOffsetClass(1))}>
                                            <IntInput
                                                name = 'arrivedAmount'
                                                defaultValue = {item.arrivedAmount}
                                                placeholder = '请输入到货量'
                                                notIntMsg = '请输入纯数字'
                                                emptyMsg = '请输入到货量'
                                                outMaxRangeMsg = '这个数量是不是太大了..'
                                                outMinRangeMsg = '请输入不小于0的数量'
                                                max = {999999}
                                                min = {0}
                                                required
                                                />
                                        </div>
                                        <input type = 'hidden' name = 'purchaseId' value = {item.purchaseId}/>
                                    </div>
                                )
                        }
                    </td>
                </tr>
            );
        });

        return (
            <Modal
                title = {
                <span>
                    <h4 className = 'modal-title'>到货列表</h4>
                    <h5 className = 'modal-title'>材料名称:{target.materialName}</h5>
                    <h5 className = 'modal-title'>规格型号:{target.spName}</h5>
                </span>
                }
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {event => dispatch(
                        updateArrived(target, event.target.arrivedAmount, event.target.purchaseId, module)
                    )}
                confirmable = {confirmable}
                >
                <table className = 'table table-bordered table-hover'>
                    <thead>
                    <tr>
                        <th>是否已确认(已确认的将无法修改)</th>
                        <th>到货量</th>
                    </tr>
                    </thead>
                    <tbody>
                    {arrivedRowList}
                    </tbody>
                </table>
            </Modal>
        );
    }
}

export default connect(state => ({arrivedList: state.arrivedList}))(ArrivedModal);
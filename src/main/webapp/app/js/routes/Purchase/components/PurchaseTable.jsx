import React from 'react';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import * as PurchaseActions from 'js/redux/actions/purchase';
import { showModal } from 'js/redux/actions/container';

import Table from 'js/components/table/Table';
import DeleteModal from 'js/components/DeleteModal';
import ConfirmModal from 'js/components/ConfirmModal';

import PurchaseModal from './PurchaseModal';

class PurchaseTable extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            ...PurchaseActions,
            showModal: showModal
        }, this.props.dispatch);

        this.getLastColumn = this.getLastColumn.bind(this);
    }

    getComment(item, index, rowClass) {
        if (item.arrivedCount != item.confirmedCount) {
            rowClass.push('danger');
        }
        const labelList = [];
        if (0 < (item.applyAmount - item.contractAmount)) {
            labelList.push(
                <label style = {{color: '#f00'}} key = {1}>申请书两比合同上数量超出{item.applyAmount - item.contractAmount}</label>
            );
        }
        labelList.push(
            <label key = {2}>总单数:{item.totalPurchaseCount}, 已填到货单数:{item.arrivedCount},
                采购部确认单数:{item.confirmedCount}</label>
        );
        return (
            <span>
                {labelList}
            </span>
        );
    }

    getLastColumn(purchase, index, rowClass) {
        if (purchase.confirmed) {
            rowClass.push('success');
        } else if (0 < purchase.arrivedAmount) {
            rowClass.push('danger');
        }
        return (
            <span>

                {
                    purchase.confirmed ?
                        '已确认' :
                        <button
                            className = 'btn btn-default'
                            onClick = {() => this.actions.showModal(
                                <ConfirmModal
                                    title = '采购确认'
                                    body = {0 < purchase.arrivedAmount ? '是否确定确认本次采购记录?' : '实际到货量为0, 不能确认'}
                                    target = {purchase}
                                    confirmable = {0 < purchase.arrivedAmount}
                                    callback = {(event, purchase) => {
                                        this.actions.verifyPurchase(purchase);
                                    }}
                                    />
                            )}>
                            确认
                        </button>
                }
            </span>
        );
    }

    handleDownloadClick(confirmed) {
        const { download } = this.actions;
        const { purchase, projectId } = this.props;
        if (0 < purchase.selectedApplyRecord.applyId) {
            download(purchase.selectedApplyRecord.applyId, null, null, confirmed);
        } else {
            download(
                projectId, purchase.selectedApplyRecord.serialNO ||
                null, purchase.selectedApplyRecord.listNO ||
                null, confirmed
            );
        }
    }

    render() {
        let tb = null;
        const { purchase, title } = this.props;
        const { unselectApplyRecord, showModal } = this.actions;
        if (purchase.selectedApplyRecord) {
            tb = {
                data: purchase.purchaseList,
                key: 'item.purchaseId || index',
                caption: (
                    <div className = 'row' style = {{marginRight: '5%'}}>
                        {
                            <div>
                                {

                                    0 < purchase.selectedApplyRecord.applyId ?
                                        <button
                                            className = 'btn btn-info btn-sm'
                                            onClick = {() => showModal(
                                                <PurchaseModal target = {purchase.selectedApplyRecord} />
                                            )}>
                                            添加采购记录
                                        </button> : null
                                }
                                <button
                                    className = 'btn btn-info btn-sm'
                                    onClick = {this.handleDownloadClick.bind(this)}
                                    >
                                    生成excel
                                </button>
                                <button
                                    className = 'btn btn-info btn-sm'
                                    onClick = {this.handleDownloadClick.bind(this, true)}
                                    >
                                    生成已确认excel
                                </button>

                            </div>
                        }
                        <h4 style = {{display: 'inline-block'}}>材料:</h4>
                        {purchase.selectedApplyRecord.materialName}
                        <h4 style = {{display: 'inline-block'}}>&nbsp;&nbsp;&nbsp;&nbsp;规格型号: </h4>
                        {purchase.selectedApplyRecord.spName}
                    </div>
                ),
                header: 0 < purchase.selectedApplyRecord.applyId ?
                    ['序号', '单价', '采购数量', '总金额', '供应商', '实际到货量', '采购单号', '送货单号', '采购确认'] :
                    ['材料名', '规格型号', '单价', '采购数量', '总金额', '供应商', '实际到货量', '采购单号', '送货单号', '采购确认'],
                row: 0 < purchase.selectedApplyRecord.applyId ? [
                    'index + 1', 'item.unitPrice', 'item.purchaseAmount',
                    'item.totalCost', 'item.supplier', 'item.arrivedAmount',
                    '\'B-\' + item.serialNO', 'item.listNO', this.getLastColumn] : [
                    'item.materialName', 'item.spName', 'item.unitPrice',
                    'item.purchaseAmount', 'item.totalCost', 'item.supplier',
                    'item.arrivedAmount', '\'B-\' + item.serialNO', 'item.listNO', this.getLastColumn
                ]
            };
        }
        return (
            <ReactCSSTransitionGroup
                transitionName = 'animateRight'
                transitionEnterTimeout = {300}
                transitionLeaveTimeout = {300}
                style = {{position: 'fixed', zIndex: 2050}}
                >
                {
                    purchase.selectedApplyRecord ?
                        <div style = {{
                            position: 'fixed',
                            height: 0 < purchase.selectedApplyRecord.applyId ? '65%' : '85%',
                            width: '100%',
                            bottom: '0',
                            left: '0',
                            background: '#fff',
                            boxShadow: '0 1px 25px 5px #999',
                            overflowY: 'scroll',
                            padding: '5px'
                        }}>
                            <div style = {{position: 'absolute', top: '10px', right: '10px'}}>
                                <button
                                    type = 'button btn-md'
                                    className = 'close'
                                    aria-label = 'Close'
                                    style = {{fontSize: '30px', outline: 'none'}}
                                    onClick = {() => unselectApplyRecord()}
                                    >
                                    <span aria-hidden = 'true'>&times;</span>
                                </button>
                                <h4 className = 'modal-title'>{title}</h4>
                            </div>
                            <Table tb = {tb}/>
                        </div> :
                        null
                }
            </ReactCSSTransitionGroup>
        );
    }
}

export default connect(state =>({purchase: state.purchase}))(PurchaseTable);
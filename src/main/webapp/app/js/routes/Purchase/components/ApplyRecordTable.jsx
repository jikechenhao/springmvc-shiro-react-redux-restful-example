import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';

import { queryApplyRecord } from 'js/redux/actions/applyRecord';
import { selectApplyRecord } from 'js/redux/actions/purchase';

import Table from 'js/components/table/Table';

class ApplyRecordTable extends React.Component {
    componentDidMount() {
        this.props.dispatch(queryApplyRecord(this.props.module));
    }

    getComment(item, index, rowClass) {
        if (item.arrivedCount != item.confirmedCount) {
            rowClass = 'danger';
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

    getLastColumn(applyRecord, index) {
        const { dispatch } = this.props;
        return (
            <span>
                <button
                    className = 'btn btn-default'
                    onClick = {() => dispatch(selectApplyRecord(applyRecord))}
                    >
                    采购操作
                </button>
            </span>
        );
    }

    //handleFilterTextChange: function (event) {
    //    var serialNO = event.target.value;
    //    if (0 === serialNO.indexOf('A')) {
    //        if (2 > serialNO.length) {
    //            return;
    //        }
    //        serialNO = serialNO.substring(2);
    //    }
    //
    //    ApplyRecordAction.updateFilterText(this.props.module.moduleId, serialNO);
    //},
    render() {
        const { module, purchase} = this.props;
        const tb = {
            data: module.applyRecordList,
            key: 'item.applyId',
            header: ['序号', '材料名称', '规格型号', '品牌', '单位', '申请数量', '系统批注', '申请单号', '操作'],
            rowClassFunc: item => {
                if (purchase.selectedApplyRecord && item.applyId == purchase.selectedApplyRecord.applyId) {
                    return 'info';
                }
            },
            row: ['index + 1', 'item.materialName', 'item.spName',
                'item.brandName', 'item.unit', 'item.applyAmount',
                this.getComment, '\'A-\' + item.serialNO', this.getLastColumn.bind(this)
            ]
        };

        return (
            <Table tb = {tb}/>
        );
    }
}

export default connect(state => ({purchase: state.purchase}))(ApplyRecordTable);
import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import * as ApplyRecordActions from 'js/redux/actions/applyRecord';
import { showModal } from 'js/redux/actions/container';

import Table from 'js/components/table/Table';
import DeleteModal from 'js/components/DeleteModal';

import ArrivedModal from './ArrivedModal';

import { getColClass } from 'js/util/styleUtil';

class ApplyRecordTable extends React.Component {
    shouldComponentUpdate(nextProps, nextState) {
        const { module } = this.props;

        return module !== nextProps.module;
    }

    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            ...ApplyRecordActions,
            showModal: showModal
        }, this.props.dispatch);

        this.getLastColumn = this.getLastColumn.bind(this);
    }

    componentDidMount() {
        const { module } = this.props;
        if (!module.applyRecordList) {
            const { queryApplyRecord } = this.actions;
            queryApplyRecord(module);
        }
    }

    getComment(item, index, rowClass) {
        if (item.arrivedCount != item.confirmedCount) {
            rowClass.push('danger');
        }
        const labelList = [];
        if (0 < (item.applyAmount - item.contractAmount)) {
            labelList.push(
                <label
                    style = {{color: '#f00'}}
                    key = {1}
                    >
                    申请数量比合同上数量超出{item.applyAmount - item.contractAmount}
                </label>
            );
        }
        labelList.push(
            <label key = {2}>
                总单数:{item.totalPurchaseCount},
                已填到货单数:{item.arrivedCount},
                采购部确认单数:{item.confirmedCount}
            </label>
        );
        return (<span>{labelList}</span>);
    }

    getLastColumn(applyRecord) {
        const module = this.props.module;
        const { showModal, deleteApplyRecord } = this.actions;
        return (
            <span>
                {
                    (null == applyRecord.confirmedCount || 0 == applyRecord.confirmedCount) ?
                        <button
                            className = 'btn btn-danger'
                            onClick = {() => showModal(
                                <DeleteModal
                                    title = {'规格型号: ' + applyRecord.spName}
                                    target = {applyRecord}
                                    onFormSubmit = {() => deleteApplyRecord(module, applyRecord)}
                                    body = {'是否确定删除该申请记录?'}
                                    />
                            )}>
                            删除
                        </button> :
                        null
                }
                <button
                    className = 'btn btn-default'
                    onClick = {() => showModal(
                        <ArrivedModal target = {applyRecord} module = {module} />
                    )}
                    >到货量
                </button>
            </span>
        );
    }

    render() {
        const { module } = this.props;
        const { download } = this.actions;
        const tb = {
            data: module.applyRecordList,
            key: 'item.applyId',
            shouldRowUpdate: (props, nextProps) => (true),
            caption: (
                <div className = 'row'>
                    <button
                        className = 'btn btn-info btn-sm pull-right'
                        onClick = {() => download(module.moduleId)}
                        >
                        生成当前表格
                    </button>
                </div>
            ),
            header: [
                '序号', '材料名称', '规格型号', '品牌', '单位', '申请数量', '已填到货量', '备注', '系统批注', '填表人', '申请单号', '操作'
            ],
            row: [
                'index + 1', 'item.materialName', 'item.spName',
                'item.brandName', 'item.unit', 'item.applyAmount',
                'item.arrivedAmount', 'item.comment', this.getComment,
                'item.applyUser', '\'A-\' + item.serialNO', this.getLastColumn
            ]
        };

        return (<Table tb = {tb}/>);
    }
}

export default connect(state => ({}))(ApplyRecordTable);
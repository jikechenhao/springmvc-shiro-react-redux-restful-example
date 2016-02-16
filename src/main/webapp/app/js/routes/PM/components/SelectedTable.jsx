import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { createApply, removeApply } from 'js/redux/actions/apply';

import Table from 'js/components/table/Table';

class SelectedTable extends React.Component {
    handleApplySubmit() {
        const { dispatch, projectId, moduleId, applyList } = this.props;
        dispatch(createApply(projectId, moduleId, applyList));
    }

    getLastColumn(apply) {
        return (
            <span>
                <button
                    className = 'btn btn-danger'
                    onClick = {() => this.props.dispatch(removeApply(apply))}
                    >
                    删除
                </button>
            </span>
        );
    }

    render() {
        const { applyList } = this.props;
        const tb = {
            data: applyList,
            key: 'index',
            caption: (
                <span>
                    待提交申请列表
                    <button
                        className = 'btn btn-info btn-sm pull-right'
                        onClick = {this.handleApplySubmit.bind(this)}
                        >
                        提交申请
                    </button>
                </span>
            ),
            header: [
                '材料名称', '规格型号', '单位', '品牌', '申请数量', '备注', '申请人', '操作'
            ],
            row: [
                'item.materialName', 'item.spName', 'item.unit',
                'item.brandName', 'item.applyAmount', 'item.comment',
                'item.applyUser', this.getLastColumn.bind(this)
            ]
        };
        return (
            <div style = {{height: '49.5%'}}>
                <Table tb = {tb}/>
            </div>
        );
    }
}

export default connect(state => ({applyList: state.applyList}))(SelectedTable);
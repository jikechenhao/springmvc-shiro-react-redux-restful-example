import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { querySpForApply } from 'js/redux/actions/material';
import { showModal } from 'js/redux/actions/container';

import Table from 'js/components/table/Table';

import ApplyModal from './ApplyModal';

class SpSelectTable extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            querySpForApply: querySpForApply,
            showModal: showModal
        }, this.props.dispatch);

        this.getLastColumn = this.getLastColumn.bind(this);
    }

    componentDidMount() {
        this.actions.querySpForApply(this.props.material);
    }

    getLastColumn(sp) {
        const { showModal } = this.actions;
        const { material, projectId } = this.props;
        return (
            <span>
                <button
                    className = 'btn btn-default'
                    onClick = {() => showModal(
                        <ApplyModal
                            title = {
                                <span>
                                    <h4 className = 'modal-title'>申请材料: {material.materialName}</h4>
                                    <h4 className = 'modal-title'>申请规格: {sp.spName}</h4>
                                </span>
                            }
                            target = {sp}
                            material = {material}
                            projectId = {projectId}
                            />
                    )}>
                    申请该规格
                </button>
            </span>
        );
    }

    render() {
        const { material } = this.props;
        const tb = {
            data: material.spList,
            key: 'item.spId',
            header: [
                '序号', '规格型号', '单位', '总申请量', '操作'],
            wRate: [1, 13, 1, 2, 3],
            row: ['index + 1', 'item.spName', 'item.unit', 'item.totalApplyAmount', this.getLastColumn]
        };
        return (
            <div style = {{height: '49.5%'}}>
                <Table
                    tb = {tb}
                    >
                </Table>
            </div>
        );
    }
}

export default connect(state => ({}))(SpSelectTable);
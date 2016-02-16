import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import * as PurchaseActions from 'js/redux/actions/purchase';

import Table from 'js/components/table/Table';
import Form from 'js/components/validation/Form';
import TextInput from 'js/components/validation/TextInput';

class UncommittedTable extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            ...PurchaseActions,
        }, this.props.dispatch);

        this.getLastColumn = this.getLastColumn.bind(this);
        this.handlePurchaseFormSubmit = this.handlePurchaseFormSubmit.bind(this);
    }

    handlePurchaseFormSubmit(event) {
        const { projectId, purchase} = this.props;
        this.actions.createPurchase(projectId, purchase.uncommittedList, event.target.listNO.value);
    }

    getLastColumn(purchase) {
        return (
            <span>
                <button
                    className = 'btn btn-danger'
                    onClick = {() => this.actions.removePurchase(purchase)}
                    >
                    删除
                </button>
            </span>
        );
    }

    render() {
        const { purchase } = this.props;
        const tb = {
            data: purchase.uncommittedList,
            key: 'index',
            caption: (
                <span>
                    待提交采购列表
                    <button
                        className = 'btn btn-info btn-sm pull-right'
                        type = 'submit'
                        >
                        提交
                    </button>
                </span>
            ),
            header: [
                '材料名称', '规格型号', '品牌', '单位', '数量', '单价', '金额', '供应商', '操作'
            ],
            row: ['item.materialName', 'item.spName', 'item.brandName',
                'item.unit', 'item.purchase_amount', 'item.unitPrice',
                'item.totalCost', 'item.supplier', this.getLastColumn
            ]
        };
        return (
            <div className = 'row' style = {{height: '49.5%'}}>
                <Form
                    onSubmit = {this.handlePurchaseFormSubmit}
                    preventDefault = {true}>
                    <Table tb = {tb} />

                    <div className = 'form-group col-sm-19 col-xs-19 col-md-19'>
                        <label className = 'col-sm-4 col-sm-offset-2 control-label'>送货单号:</label>

                        <div
                            className = 'col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1'>
                            <TextInput
                                name = 'listNO'
                                placeholder = '请输送货单号'
                                emptyMsg = '请输送货单号'
                                outRangeMsg = '送货单号最多为45个字符'
                                maxLength = '45'
                                required
                                />
                        </div>
                    </div>
                </Form>
            </div>
        );
    }
}

export default connect(state => ({purchase: state.purchase}))(UncommittedTable);
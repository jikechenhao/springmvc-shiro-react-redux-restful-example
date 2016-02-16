import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { queryNav, updateNav } from 'js/redux/actions/container';
import { queryModuleWithConfirmedPurchase, downloadStorageExcel } from 'js/redux/actions/module';
import * as FilterActions from 'js/redux/actions/filter';

import { getHomeUrl } from 'js/routes/routeUtil';

import Table from 'js/components/table/Table';
import Select from 'js/components/validation/Select';
import Collapse from 'js/components/Collapse';

import FilterResultCollapse from './FilterResultCollapse';
import ConfirmedPurchaseTable from './ConfirmedPurchaseTable';

class ConfirmedPurchaseCollapse extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            ...FilterActions,
            queryModuleWithConfirmedPurchase: queryModuleWithConfirmedPurchase,
            downloadStorageExcel: downloadStorageExcel,
            queryNav: queryNav,
            updateNav: updateNav,
        }, this.props.dispatch);
    }

    componentDidMount() {
        const { projectId } = this.props.params;
        const { queryModuleWithConfirmedPurchase, queryNav, updateNav } = this.actions;
        queryModuleWithConfirmedPurchase(projectId);
        queryNav(projectId, null, null, payload => {
            updateNav([
                {path: getHomeUrl() + '/project', title: '项目(' + payload.entity.projectName + ')'},
                {path: this.props.location.pathname, title: '项目详情'}
            ]);
        });
    }

    render() {
        console.log('comfirmed pur collapse render');
        const { updateMaterialNameFilter, updateSpNameFilter, updateSupplierFilter, downloadStorageExcel } = this.actions;
        const { moduleList, params } = this.props;
        const materialList = [];
        const spList = [];
        const supplierList = [];
        const moduleCollapseList = [];
        if (moduleList) {
            moduleList.forEach((item, index) => {
                moduleCollapseList.push(
                    <Collapse
                        header = {
                            <div style = {{lineHeight: '30px'}}>
                                {item.moduleName}
                            </div>
                        }
                        key = {item.moduleId}
                        opened = {1 > index}
                        >
                        <ConfirmedPurchaseTable module = {item} key = {item.moduleId + '-' + index}/>
                    </Collapse>
                );

                !item.confirmedPurchaseList ||
                item.confirmedPurchaseList.forEach((confirmedPurchase, innerIndex) => {
                    materialList.push(confirmedPurchase.materialName);
                    spList.push(confirmedPurchase.spName);
                    supplierList.push(confirmedPurchase.supplier);
                });
            });
        }

        return (
            <div>
                <div className = 'row' style = {{marginBottom: '10px'}}>
                    <button
                        className = 'btn btn-info btn-sm pull-right'
                        onClick = {() => downloadStorageExcel(params.projectId)}
                        style = {{marginLeft: '10px'}}
                        >
                        生成excel
                    </button>
                    <div className = 'btn-group pull-right dropdown' style = {{maxWidth: '250px', marginLeft: '10px'}}>
                        <Select
                            defaultOptionText = '不限制材料'
                            defaultOptionValue = ''
                            optionList = {materialList}
                            onChange = {event => updateMaterialNameFilter(event.target.value.trim())}
                            />
                    </div>
                    <div className = 'btn-group pull-right dropdown' style = {{maxWidth: '250px', marginLeft: '10px'}}>
                        <Select
                            defaultOptionText = '不限制规格'
                            defaultOptionValue = ''
                            optionList = {spList}
                            onChange = {event => updateSpNameFilter(event.target.value.trim())}
                            />
                    </div>
                    <div className = 'btn-group pull-right dropdown' style = {{maxWidth: '250px', marginLeft: '10px'}}>
                        <Select
                            defaultOptionText = '不限制供应商'
                            defaultOptionValue = ''
                            optionList = {supplierList}
                            onChange = {event => updateSupplierFilter(event.target.value.trim())}
                            />
                    </div>
                </div>
                <FilterResultCollapse projectId = {params.projectId}/>
                {moduleCollapseList}
            </div>
        );
    }
}

export default connect(state => ({moduleList: state.moduleList}))(ConfirmedPurchaseCollapse);
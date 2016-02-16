import React from 'react';
import { connect } from 'react-redux';

import { downloadStorageExcel } from 'js/redux/actions/module';

import Collapse from 'js/components/Collapse';

import ConfirmedPurchaseTable from './ConfirmedPurchaseTable';

class FilterResultCollapse extends React.Component {
    render () {
        const { dispatch, filter, projectId } = this.props;
        if (!filter.materialNameFilter && !filter.spNameFilter && !filter.supplierFilter) {
            return null;
        }

        const moduleList = [];
        const moduleCollapseList = [];
        const filteredModule = [];
        if (this.props.moduleList) {
            this.props.moduleList.forEach((item, index) => {
                item.confirmedPurchaseList.forEach((confirmedPurchase) => {
                    if (
                        (!filter.materialNameFilter || -1 < confirmedPurchase.materialName.indexOf(filter.materialNameFilter)) &&
                        (!filter.spNameFilter || -1 < confirmedPurchase.spName.indexOf(filter.spNameFilter)) &&
                        (!filter.supplierFilter || -1 < confirmedPurchase.supplier.indexOf(filter.supplierFilter))
                    ) {
                        if (!filteredModule.includes(item.moduleId)) {
                            filteredModule.push(item.moduleId);
                            moduleList.push({
                                moduleId: item.moduleId,
                                moduleName: item.moduleName,
                                confirmedPurchaseList: []
                            });
                            moduleCollapseList.push(
                                <Collapse
                                    header = {
                                        <div style = {{lineHeight: '30px'}}>
                                            {item.moduleName}
                                        </div>
                                    }
                                    key = {item.moduleId}
                                    opened = {false}
                                    >
                                    <ConfirmedPurchaseTable
                                        module = {moduleList[moduleList.length - 1]}
                                        key = {item.moduleId}
                                        />
                                </Collapse>
                            );
                        }
                        moduleList[moduleList.length - 1].confirmedPurchaseList.push(confirmedPurchase);
                    }
                });
            });
        }

        return (
            <div>
                <Collapse
                    header = {'查询结果'}
                    key = {-1}
                    opened = {true}
                    panelType = 'success'
                    >
                    <div className = 'row' style = {{marginBottom: '10px'}}>
                        <button
                            className = 'btn btn-info btn-sm pull-right'
                            onClick = {() =>
                                dispatch(downloadStorageExcel(
                                    projectId,
                                    filter.materialNameFilter,
                                    filter.spNameFilter,
                                    filter.supplierFilter
                                ))}
                            style = {{marginLeft: '10px'}}
                            >
                            生成excel
                        </button>
                    </div>
                    {0 < moduleCollapseList.length ? moduleCollapseList : '没有符合条件的记录'}
                </Collapse>
            </div>
        );
    }
}

export default connect(state => ({moduleList: state.moduleList, filter: state.filter}))(FilterResultCollapse);
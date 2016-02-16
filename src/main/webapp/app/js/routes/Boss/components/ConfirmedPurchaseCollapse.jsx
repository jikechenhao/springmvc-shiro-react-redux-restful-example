import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { queryNav, updateNav } from 'js/redux/actions/container';
import { queryModuleWithConfirmedPurchase, downloadBossExcel } from 'js/redux/actions/module';

import { getHomeUrl } from 'js/routes/routeUtil';

import Table from 'js/components/table/Table';
import Select from 'js/components/validation/Select';
import Collapse from 'js/components/Collapse';

import ConfirmedPurchaseTable from './ConfirmedPurchaseTable';

class ConfirmedPurchaseCollapse extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            queryModuleWithConfirmedPurchase: queryModuleWithConfirmedPurchase,
            downloadBossExcel: downloadBossExcel,
            queryNav: queryNav,
            updateNav: updateNav,
        }, this.props.dispatch);
    }

    componentDidMount () {
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

    handleDownloadClick() {
        ConfirmedPurchaseAction.downloadBossExcel(this.props.params.projectId);
    }

    render () {
        const { downloadBossExcel } = this.actions;
        const { moduleList, params } = this.props;
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
            });
        }

        return (
            <div>
                <div className = 'row' style = {{marginBottom: '10px'}}>
                    <button
                        className = 'btn btn-info btn-sm pull-right'
                        onClick = {() => downloadBossExcel(params.projectId)}
                        style = {{marginLeft: '10px'}}
                        >
                        生成excel
                    </button>
                </div>
                {moduleCollapseList}
            </div>
        );
    }
}

export default connect(state => ({moduleList: state.moduleList}))(ConfirmedPurchaseCollapse);

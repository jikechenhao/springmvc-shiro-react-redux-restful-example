import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { queryPurchaseByCondition, resetPurchase } from 'js/redux/actions/purchase';
import { queryModule } from 'js/redux/actions/module';
import { queryNav, updateNav } from 'js/redux/actions/container';

import { getHomeUrl } from 'js/routes/routeUtil';

import Collapse from 'js/components/Collapse';

import FilterInput from 'js/components/validation/FilterInput';

import ApplyRecordTable from './ApplyRecordTable';
import PurchaseTable from './PurchaseTable';
import UncommittedTable from './UncommittedTable';
import 'css/animate.css';

class ModuleCollapse extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            queryModule: queryModule,
            queryNav: queryNav,
            updateNav: updateNav,
            queryPurchaseByCondition: queryPurchaseByCondition,
            resetPurchase: resetPurchase
        }, this.props.dispatch);
    }

    componentDidMount () {
        const { projectId } = this.props.params;
        const { queryModule, queryNav, updateNav, resetPurchase } = this.actions;

        queryModule(projectId);
        resetPurchase();
        queryNav(projectId, null, null, payload =>{
            updateNav([
                {path: getHomeUrl() + '/project', title: '项目(' + payload.entity.projectName + ')'},
                {path: this.props.location.pathname, title: '采购记录&采购'}
            ]);
        });
    }

    render () {
        const moduleCollapseList = [];
        const { moduleList, params } = this.props;
        const { queryPurchaseByCondition } = this.actions;
        if (moduleList) {
            moduleList.forEach((item, index) => {
                moduleCollapseList.push(
                    <Collapse
                        header={item.moduleName}
                        key={item.moduleId}
                        >
                        <ApplyRecordTable module={item} key={item.moduleId + '-' + index}/>
                    </Collapse>
                );
            });
        }

        return (
            <div className='row'>
                <div className = 'row'>
                    <button
                        className = 'btn btn-info btn-sm pull-right'
                        onClick = {() => queryPurchaseByCondition(params.projectId, this.refs.condition.value, null)}
                        >
                        搜送货单号
                    </button>
                    <button
                        className = 'btn btn-info btn-sm pull-right'
                        onClick = {() => queryPurchaseByCondition(params.projectId, null, this.refs.condition.value)}
                        >
                        搜采购单号
                    </button>
                    <div className = 'col-sm-4 pull-right form-group' style = {{marginRight: '15px'}}>
                        <input
                            type = 'text'
                            className = 'form-control'
                            placeholder = '采购单号格式: B-8 或 8'
                            ref = 'condition'
                            />
                    </div>
                </div>
                <div className='row'>
                    <UncommittedTable projectId = {params.projectId} />
                </div>
                <div className='row'>
                    {moduleCollapseList}
                    <PurchaseTable projectId = {params.projectId} />
                </div>
            </div>
        );
    }
}

export default connect(state => ({moduleList: state.moduleList}))(ModuleCollapse);
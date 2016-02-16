import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import * as ApplyRecordActions from 'js/redux/actions/applyRecord';
import { queryMaterial } from 'js/redux/actions/material';
import { queryNav, updateNav } from 'js/redux/actions/container';
import { resetApplyList } from 'js/redux/actions/apply';

import { getHomeUrl } from 'js/routes/routeUtil';

import Collapse from 'js/components/Collapse';

import SpSelectTable from './SpSelectTable';
import SelectedTable from './SelectedTable'

class Apply extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            ...ApplyRecordActions,
            resetApplyList: resetApplyList,
            queryNav: queryNav,
            updateNav: updateNav,
            queryMaterial
        }, this.props.dispatch);
    }

    componentDidMount() {
        const { moduleId } = this.props.params;
        const { queryMaterial, resetApplyList, queryNav, updateNav } = this.actions;
        queryMaterial(moduleId);
        resetApplyList();
        queryNav(null, this.props.params.moduleId, null, payload => {
            updateNav([
                {path: getHomeUrl() + '/project', title: '项目(' + payload.entity.projectName + ')'},
                {
                    path: getHomeUrl() + '/' + payload.entity.projectId + '/module',
                    title: '模块(' + payload.entity.moduleName + ')'
                },
                {path: this.props.location.pathname, title: '材料申请'}
            ]);
        });
    }

    render() {
        const materialCollapseList = [];
        const { materialList, params } = this.props;
        if (materialList) {
            materialList.forEach((item, index) => {
                materialCollapseList.push(
                    <Collapse
                        header = {item.materialName}
                        key = {item.materialId}
                        opened = {1 > index}
                        >
                        <SpSelectTable
                            material = {item}
                            projectId = {params.projectId}
                            />
                    </Collapse>
                );
            });
        }
        return (
            <div className = 'row'>
                <div className = 'row'>
                    <SelectedTable
                        projectId = {params.projectId}
                        moduleId = {params.moduleId}
                        />
                </div>
                <div className = 'row'>
                    {materialCollapseList}
                </div>
            </div>
        )
    }
}

export default connect(state => ({materialList: state.materialList}))(Apply);
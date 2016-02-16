import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import  { queryNav, updateNav }from 'js/redux/actions/container';
import * as ProjectActions from 'js/redux/actions/project';
import { updateTextFilter } from 'js/redux/actions/filter';

import { getHomeUrl } from 'js/routes/routeUtil';

import Table from 'js/components/table/Table';
import FilterInput from 'js/components/validation/FilterInput';

class ProjectTable extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            ...ProjectActions,
            queryNav: queryNav,
            updateNav: updateNav,
            updateTextFilter: updateTextFilter
        }, this.props.dispatch);

        this.getLastColumn = this.getLastColumn.bind(this);
    }

    componentDidMount() {
        const { projectId } = this.props.params;
        const { queryProject, queryNav, updateNav } = this.actions;
        queryProject();
        queryNav(projectId, null, null, payload => {
            updateNav([
                {path: this.props.location.pathname, title: '项目'},
            ]);
        });
    }

    getLastColumn(project) {
        return (
            <Link to = {`${getHomeUrl()}/${project.projectId}/module`} className = 'btn btn-default'>查看系统</Link>
        );
    }

    render() {
        const { projectList, textFilter } = this.props;
        const { updateTextFilter } = this.actions;
        const tb = {
            data: projectList,
            key: 'item.projectId',
            caption: '已有项目(共' + projectList.length + '项)',
            header: [
                '序号', (
                    <FilterInput
                        label = '项目名'
                        placeholder = '输入关键字以过滤列表'
                        onTextFilterChange = {event => updateTextFilter(event.target.value.trim())}
                        />
                ), '合同编号', '创建时间', '操作'],
            wRate: [1, 6, 4, 3, 6],
            onFilter: item => (!textFilter || -1 < item.projectName.indexOf(textFilter)),
            row: ['index + 1', 'item.projectName', 'item.contractNO', 'date.item.createDate', this.getLastColumn]
        };

        return (
            <Table tb = {tb} />
        );
    }
}

export default connect(state => ({projectList: state.projectList, textFilter: state.filter.textFilter}))(ProjectTable);
import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import * as ContainerActions from 'js/redux/actions/container';
import * as ProjectActions from 'js/redux/actions/project';
import { updateTextFilter } from 'js/redux/actions/filter';

import { getHomeUrl } from 'js/routes/routeUtil';

import Table from 'js/components/table/Table';
import FilterInput from 'js/components/validation/FilterInput';
import Form from 'js/components/validation/Form';
import TextInput from 'js/components/validation/TextInput';
import DeleteModal from 'js/components/DeleteModal';

import UpdateProjectModal from './UpdateProjectModal';

class ProjectTable extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            ...ProjectActions,
            ...ContainerActions,
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
        const { showModal, deleteProject } = this.actions;
        return (
            <span>
                <Link to = {`${getHomeUrl()}/${project.projectId}/preview`} className = 'btn btn-default'>预览</Link>
                <Link to = {`${getHomeUrl()}/${project.projectId}/module`} className = 'btn btn-default'>查看系统</Link>
                <Link to = {`${getHomeUrl()}/${project.projectId}/brand`} className = 'btn btn-default'>查看品牌</Link>
                <button
                    type = 'button'
                    className = 'btn btn-warning'
                    onClick = {() =>
                        showModal(
                            <UpdateProjectModal target = {project} />
                        )}
                    >
                    修改
                </button>
                <button
                    type = 'button'
                    className = 'btn btn-danger'
                    onClick = {() =>
                        showModal(
                            <DeleteModal
                                onFormSubmit = {(event) => deleteProject(event.target.deletePwd.value, project)}
                                title = {'删除项目: ' + project.projectName}
                                target = {project}
                                />
                        )}
                    >
                    删除
                </button>
            </span>
        );
    }

    render() {
        const { projectList, textFilter } = this.props;
        const { updateTextFilter, createProject } = this.actions;
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
            <Form onSubmit = {event => createProject(event.target)}>
                <Table tb = {tb}>
                    <tr>
                        <td>添加项目</td>
                        <td className = 'row'>
                            <TextInput
                                type = 'text'
                                name = 'projectName'
                                placeholder = '请输入项目名'
                                emptyMsg = '请输入项目名'
                                outRangeMsg = '项目名最多为45个字符'
                                maxLength = '45'
                                autoFocus
                                required
                                />
                        </td>
                        <td>
                            <TextInput
                                type = 'text'
                                name = 'contractNO'
                                placeholder = '请输入合同编号'
                                emptyMsg = '请输入合同编号'
                                outRangeMsg = '合同编号最多为45个字符'
                                maxLength = '45'
                                required
                                />
                        </td>
                        <td>未创建</td>
                        <td>
                            <button type = 'submit' className = 'btn btn-info'>确定添加</button>
                        </td>
                    </tr>
                </Table>
            </Form>
        );
    }
}

export default connect(state => ({projectList: state.projectList, textFilter: state.filter.textFilter}))(ProjectTable);
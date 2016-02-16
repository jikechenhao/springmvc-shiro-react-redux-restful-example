import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import * as ContainerActions from 'js/redux/actions/container';
import * as ModuleActions from 'js/redux/actions/module';
import { updateTextFilter } from 'js/redux/actions/filter';

import { getHomeUrl } from 'js/routes/routeUtil';

import Table from 'js/components/table/Table';
import Form from 'js/components/validation/Form';
import FilterInput from 'js/components/validation/FilterInput';
import TextInput from 'js/components/validation/TextInput';
import FileInput from 'js/components/validation/FileInput';
import DeleteModal from 'js/components/DeleteModal';
import ProcessingModal from 'js/components/ProcessingModal';

import UpdateModuleModal from './UpdateModuleModal';

class ModuleTable extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            ...ModuleActions,
            ...ContainerActions,
            updateTextFilter: updateTextFilter
        }, this.props.dispatch);

        this.handleExcelFormSubmit = this.handleExcelFormSubmit.bind(this);
        this.getLastColumn = this.getLastColumn.bind(this);
    }

    componentDidMount() {
        const { projectId } = this.props.params;
        const { queryModule, queryNav, updateNav } = this.actions;

        queryModule(projectId);
        queryNav(projectId, null, null, payload =>{
            updateNav([
                {path: getHomeUrl() + '/project', title: '项目(' + payload.entity.projectName + ')'},
                {path: this.props.location.pathname, title: '模块'}
            ]);
        });
    }

    handleExcelFormSubmit(event) {
        const { excel } = event.target;
        const { uploadExcel, showModal } = this.actions;
        const file = excel.dataTransfer ?
            excel.dataTransfer.files[0] :
            excel.files[0];
        uploadExcel(event.target, file, this.props.params.projectId);
        showModal(<ProcessingModal message = '解析excel中(若太久没反应请刷新重试)...' />);
    }

    getLastColumn(module) {
        const { showModal, deleteModule } = this.actions;
        return (
            <span>
                <Link to = {`${getHomeUrl()}/${module.moduleId}/material`} className = 'btn btn-default'>查看材料</Link>
                <button
                    type = 'button'
                    className = 'btn btn-warning'
                    onClick = {() => showModal(<UpdateModuleModal target = {module} />)}
                    >
                    修改
                </button>
                <button
                    type = 'button'
                    className = 'btn btn-danger'
                    onClick = {() =>
                        showModal(
                            <DeleteModal
                                title = {'删除模块: ' + module.moduleName}
                                target = {module}
                                onFormSubmit = {event => deleteModule(event.target.deletePwd.value, module)}
                                />
                        )}
                    >
                    删除
                </button>
            </span>
        );
    }

    render() {
        const { moduleList, textFilter } = this.props;
        const { updateTextFilter, createModule } = this.actions;
        const tb = {
            data: moduleList,
            key: 'item.moduleId',
            caption: (
                <div>
                    <Form
                        encType = 'multipart/form-data'
                        onSubmit = {this.handleExcelFormSubmit}
                        >
                        <FileInput
                            wrapperClassName = 'pull-right'
                            name = 'excel'
                            validExtensions = {['.xlsx']}
                            required/>

                        <input type = 'submit' className = 'btn btn-default pull-right' value = '上传'/>
                    </Form>
                    已有模块:(共{moduleList.length}项)
                </div>
            ),
            header: [
                '序号', (
                    <FilterInput
                        label = '系统名'
                        placeholder = '输入关键字以过滤列表'
                        onTextFilterChange = {event => updateTextFilter(event.target.value.trim())}
                        />
                ), '操作'],
            wRate: [2, 13, 5],
            onFilter: item => (!textFilter|| -1 < item.moduleName.indexOf(textFilter)),
            row: ['index + 1', 'item.moduleName', this.getLastColumn]
        };

        return (
            <Table tb = {tb}>
                <tr>
                    <td>添加系统</td>
                    <td>
                        <Form onSubmit = {event => createModule(event.target, this.props.params.projectId)}>
                            <TextInput
                                name = 'moduleName'
                                placeholder = '请输入系统名'
                                emptyMsg = '请输入系统名'
                                outRangeMsg = '系统名最多为45个字符'
                                maxLength = '45'
                                autoFocus
                                required
                                />
                            <button type = 'submit' className = 'hidden' ref = 'submitBtn'></button>
                        </Form>
                    </td>
                    <td>
                        <button
                            type = 'submit'
                            className = 'btn btn-default'
                            onClick = {() => this.refs.submitBtn.click()}
                            >
                            确定添加
                        </button>
                    </td>
                </tr>
            </Table>
        );
    }
}

export default connect(state => ({moduleList: state.moduleList, textFilter: state.filter.textFilter}))(ModuleTable);
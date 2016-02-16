import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import * as ContainerActions from 'js/redux/actions/container';
import * as MaterialActions from 'js/redux/actions/material';
import { updateTextFilter } from 'js/redux/actions/filter';

import { getHomeUrl } from 'js/routes/routeUtil';

import Table from 'js/components/table/Table';
import Form from 'js/components/validation/Form';
import FilterInput from 'js/components/validation/FilterInput';
import TextInput from 'js/components/validation/TextInput';
import DeleteModal from 'js/components/DeleteModal';

import UpdateMaterialModal from './UpdateMaterialModal';

class MaterialTable extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            ...ContainerActions,
            ...MaterialActions,
            updateTextFilter: updateTextFilter
        }, this.props.dispatch);

        this.getLastColumn = this.getLastColumn.bind(this);
    }

    componentDidMount() {
        const { moduleId } = this.props.params;
        const { queryMaterial, queryNav, updateNav } = this.actions;
        queryMaterial(moduleId);
        queryNav(null, moduleId, null, payload => {
            updateNav([
                {path: getHomeUrl() + '/project', title: '项目(' + payload.entity.projectName + ')'},
                {
                    path: getHomeUrl() + '/' + payload.entity.projectId + '/module',
                    title: '模块(' + payload.entity.moduleName + ')'
                },
                {path: this.props.location.pathname, title: '材料'}
            ]);
        });
    }

    getLastColumn(material) {
        const { showModal, deleteMaterial } = this.actions;
        return (
            <span>
                <Link to = {`${getHomeUrl()}/${material.materialId}/sp`} className = 'btn btn-default'>查看规格型号</Link>
                <button
                    type = 'button'
                    className = 'btn btn-warning'
                    onClick = {() => showModal(<UpdateMaterialModal target = {material}/>)}>
                    修改
                </button>
                    <button
                        type = 'button'
                        className = 'btn btn-danger'
                        onClick = {() =>
                            showModal(
                                <DeleteModal
                                    title = {'删除材料: ' + material.materialName}
                                    target = {material}
                                    onFormSubmit = {event => deleteMaterial(material)}
                                    body = {'是否确定删除材料: '　+ material.materialName}
                                    />
                            )
                        }>
                        删除
                    </button>
                </span>
        );
    }

    render() {
        const { materialList, textFilter, params } = this.props;
        const { updateTextFilter, createMaterial } = this.actions;
        const tb = {
            data: materialList,
            key: 'item.materialId',
            caption: '已有材料(共' + materialList.length + '项)',
            header: [
                '序号', (
                    <FilterInput
                        label = '材料名称'
                        placeholder = '输入关键字以过滤列表'
                        onTextFilterChange = {event => updateTextFilter(event.target.value.trim())}
                        />
                ), '操作'],
            wRate: [2, 13, 5],
            onFilter: item => (!textFilter || -1 < item.materialName.indexOf(textFilter)),
            row: ['index + 1', 'item.materialName', this.getLastColumn]
        };
        return (
            <Table tb = {tb}>
                <tr>
                    <td>添加材料</td>
                    <td>
                        <Form
                            className = 'form-horizontal'
                            onSubmit = {event => createMaterial(event.target, params.moduleId)}
                            >
                            <TextInput
                                name = 'materialName'
                                placeholder = '请输入材料名'
                                emptyMsg = '请输入材料名'
                                outRangeMsg = '材料名最多为45个字符'
                                maxLength = '45'
                                autoFocus
                                required
                                />
                            <button
                                type = 'submit'
                                className = 'hidden'
                                ref = 'submitBtn'
                                >
                                确定添加
                            </button>
                        </Form>
                    </td>
                    <td>
                        <button
                            type = 'button'
                            className = 'btn btn-default'
                            onClick = {() => this.refs.submitBtn.click()}
                            >
                            确定添加
                        </button>
                    </td>
                </tr>
            </Table>
        )
    }
}

export default connect(state =>
    ({materialList: state.materialList, textFilter: state.filter.textFilter}))(MaterialTable);
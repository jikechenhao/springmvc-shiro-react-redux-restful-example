import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import * as SpActions from 'js/redux/actions/sp';
import * as ContainerActions from 'js/redux/actions/container';
import { updateTextFilter } from 'js/redux/actions/filter';

import { getHomeUrl } from 'js/routes/routeUtil';

import Table from 'js/components/table/Table';
import Form from 'js/components/validation/Form';
import FilterInput from 'js/components/validation/FilterInput';
import TextInput from 'js/components/validation/TextInput';
import IntInput from 'js/components/validation/IntInput';
import DeleteModal from 'js/components/DeleteModal';

import UpdateSpModal from './UpdateSpModal';

class SpTable extends React.Component {
    constructor(props) {
        super(props);

        this.actions = bindActionCreators({
            ...SpActions,
            ...ContainerActions,
            updateTextFilter: updateTextFilter
        }, this.props.dispatch);

        this.getLastColumn = this.getLastColumn.bind(this);
    }

    componentDidMount() {
        const { materialId } = this.props.params;
        const { querySp, queryNav, updateNav } = this.actions;
        querySp(materialId);
        queryNav(null, null, materialId, payload => {
            updateNav([
                {path: getHomeUrl() + '/project', title: '项目(' + payload.entity.projectName + ')'},
                {
                    path: getHomeUrl() + '/' + payload.entity.projectId + '/module',
                    title: '模块(' + payload.entity.moduleName + ')'
                },
                {
                    path: getHomeUrl() + '/' + payload.entity.moduleId + '/material',
                    title: '材料(' + payload.entity.materialName + ')'
                },
                {path: this.props.location.pathname, title: '规格型号'}
            ]);
        });
    }

    getLastColumn(sp) {
        const { showModal, deleteSp } = this.actions;
        const { materialId } = this.props.params;
        return (
            <span>
                <button
                    type = 'button'
                    className = 'btn btn-warning'
                    onClick = {() => showModal(<UpdateSpModal target = {sp}/>)}
                    >
                    修改
                </button>
                <button
                    type = 'button'
                    className = 'btn btn-danger'
                    onClick = {() => showModal(
                        <DeleteModal
                            title = {'删除规格型号: ' + sp.spName}
                            target = {sp}
                            onFormSubmit = {() => deleteSp(sp)}
                            body = {'是否确定删除规格型号: '　+ sp.spName}
                            />
                    )}>
                    删除
                </button>
            </span>
        );
    }

    render() {
        const { spList, params, textFilter } = this.props;
        const { updateTextFilter, createSp } = this.actions;
        const tb = {
            data: spList,
            key: 'item.spId',
            caption: '已有规格型号(共' + spList.length + '项)',
            header: [
                '序号', (
                    <FilterInput
                        label = '规格型号'
                        placeholder = '输入关键字以过滤列表'
                        onTextFilterChange = {event => updateTextFilter(event.target.value.trim())}
                        />
                ), '单位', '合同上数量', '品牌', '操作'],
            wRate: [1, 7, 2, 2, 3, 5],
            onFilter: item => (!textFilter || -1 < item.spName.indexOf(textFilter)),
            row: ['index + 1', 'item.spName', 'item.unit', 'item.contractAmount', 'item.brandName', this.getLastColumn]
        };
        return (
            <Form onSubmit = {event => createSp(event.target, params.materialId)}>
                <Table tb = {tb}>
                    <tr>
                        <td>添加规格</td>
                        <td>
                            <TextInput
                                name = 'spName'
                                placeholder = '请输入规格型号'
                                emptyMsg = '请输入规格型号'
                                outRangeMsg = '规格型号最多为1200个字符'
                                maxLength = '1200'
                                autoFocus
                                required
                                />
                        </td>
                        <td>
                            <TextInput
                                name = 'unit'
                                placeholder = '单位'
                                emptyMsg = '请输入单位'
                                outRangeMsg = '单位最多为20个字符'
                                maxLength = '20'
                                required
                                />
                        </td>
                        <td>
                            <IntInput
                                name = 'contractAmount'
                                placeholder = '数量'
                                notIntMsg = '请输入纯数字'
                                emptyMsg = '请输入合同数量'
                                outMaxRangeMsg = '这个数量是不是太大了..'
                                outMinRangeMsg = '请输入不小于0的数量'
                                max = {999999}
                                min = {0}
                                required
                                />
                        </td>
                        <td>
                            <TextInput
                                name = 'brandName'
                                placeholder = '请输入品牌'
                                emptyMsg = '请输入品牌'
                                outRangeMsg = '品牌最多为45个字符'
                                maxLength = '45'
                                required
                                />
                        </td>
                        <td>
                            <button
                                type = 'submit'
                                className = 'btn btn-default'
                                >
                                确定添加
                            </button>
                        </td>
                    </tr>
                </Table>
            </Form>
        )
    }
}

export default connect(state => ({spList: state.spList, textFilter: state.filter.textFilter}))(SpTable);
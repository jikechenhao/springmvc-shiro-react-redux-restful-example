import React from 'react'
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import * as BrandActions from 'js/redux/actions/brand';
import * as ContainerActions from 'js/redux/actions/container';
import { updateTextFilter } from 'js/redux/actions/filter';

import { getHomeUrl } from 'js/routes/routeUtil';

import Table from 'js/components/table/Table'
import Form from 'js/components/validation/Form'
import FilterInput from 'js/components/validation/FilterInput';
import TextInput from 'js/components/validation/TextInput'
import DeleteModal from 'js/components/DeleteModal'

import UpdateBrandModal from './UpdateBrandModal'

class BrandTable extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            ...BrandActions,
            ...ContainerActions,
            updateTextFilter: updateTextFilter
        }, this.props.dispatch);

        this.getLastColumn = this.getLastColumn.bind(this);
    }

    componentDidMount() {
        const { projectId } = this.props.params;
        const { queryBrand, queryNav, updateNav } = this.actions;
        queryBrand(projectId);
        queryNav(projectId, null, null, payload => {
            updateNav([
                {path: getHomeUrl() + '/project', title: '项目(' + payload.entity.projectName + ')'},
                {path: this.props.location.pathname, title: '品牌'}
            ]);
        });
    }

    getLastColumn(brand) {
        const { showModal, deleteBrand } = this.actions;
        return (
            <span>
                <button
                    className = 'btn btn-warning'
                    onClick = {() => showModal(<UpdateBrandModal target = {brand}/>)}
                    >
                    修改
                </button>
                <button
                    className = 'btn btn-danger'
                    onClick = {() => showModal(
                        <DeleteModal
                            title = {'删除品牌: ' + brand.brandName}
                            target = {brand}
                            onFormSubmit = {() => deleteBrand(brand)}
                            body = {'是否确定删除品牌: ' + brand.brandName}
                            />
                    )}>
                    删除
                </button>
            </span>
        );
    }

    render() {
        const { brandList, textFilter } = this.props;
        const { createBrand, updateTextFilter } = this.actions;
        const tb = {
            data: brandList,
            key: 'item.brandId',
            caption: '已有品牌(共' + brandList.length + '项)',
            header: [
                '序号', (
                    <FilterInput
                        label = '品牌名'
                        placeholder = '输入关键字以过滤列表'
                        onTextFilterChange = {event => updateTextFilter(event.target.value)}
                        />
                ), '操作'],
            wRate: [2, 13, 5],
            onFilter: item => (!textFilter || -1 < item.brandName.indexOf(textFilter)),
            row: ['index + 1', 'item.brandName', this.getLastColumn]
        };

        return (
            <Table tb = {tb}>
                <tr>
                    <td>添加品牌</td>
                    <td>
                        <Form onSubmit = {event => createBrand(event.target, this.props.params.projectId)}>
                            <TextInput
                                name = 'brandName'
                                placeholder = '请输入品牌名'
                                emptyMsg = '请输入品牌名'
                                outRangeMsg = '品牌名最多为45个字符'
                                maxLength = '45'
                                autoFocus
                                required
                                />
                            <button type = 'submit' className = 'hidden' ref = 'submitBtn'></button>
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
        );
    }
}

export default connect(state => ({brandList: state.brandList, textFilter: state.filter.textFilter}))(BrandTable);
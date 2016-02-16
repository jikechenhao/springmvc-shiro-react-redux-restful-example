import React from 'react'
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { queryModule } from 'js/redux/actions/module';
import { queryBrand } from 'js/redux/actions/brand';
import { queryNav, updateNav } from 'js/redux/actions/container';
import { updateTextFilter, updateBrandNameFilter } from 'js/redux/actions/filter';

import { getHomeUrl } from 'js/routes/routeUtil';
import { getColClass, getOffsetClass } from 'js/util/styleUtil';

import Collapse from 'js/components/common/Collapse';
import Select from 'js/components/validation/Select';
import PreviewTable from './PreviewTable';

class Preview extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            queryModule: queryModule,
            queryBrand: queryBrand,
            updateTextFilter: updateTextFilter,
            updateBrandNameFilter: updateBrandNameFilter,
            queryNav: queryNav,
            updateNav: updateNav
        }, this.props.dispatch);

        this.handleFilterFormSubmit = this.handleFilterFormSubmit.bind(this);
    }

    componentDidMount() {
        const { projectId } = this.props.params;
        const { queryModule, queryBrand, queryNav, updateNav } = this.actions;
        queryModule(projectId);
        queryBrand(this.props.params.projectId);
        queryNav(projectId, null, null, payload => {
            updateNav([
                {path: getHomeUrl() + '/project', title: '项目(' + payload.entity.projectName + ')'},
                {path: this.props.location.pathname, title: '预览列表'}
            ]);
        });
    }

    handleFilterFormSubmit(event) {
        event.preventDefault();
        const { updateTextFilter, updateBrandNameFilter } = this.actions;
        const brandNameFilter = '不限制品牌' === event.target.brandNameFilter.value ? null : event.target.brandNameFilter.value;
        updateTextFilter(event.target.textFilter.value || null);
        updateBrandNameFilter(brandNameFilter);
        event.target.reset();
    }

    render() {
        const { brandList, moduleList, textFilter, brandNameFilter } = this.props;
        const brandOptionList = [];
        const moduleCollapseList = [];

        if (brandList) {
            brandList.forEach(item => {
                brandOptionList.push(
                    <option key = {item.brandId}>{item.brandName}</option>
                );
            });
        }

        if (moduleList) {
            moduleList.forEach(item => {
                moduleCollapseList.push(
                    <Collapse
                        header = {item.moduleName}
                        key = {item.moduleId}
                        panelType = {textFilter || brandNameFilter ? 'info' : null}
                        >
                        <PreviewTable module = {item}/>
                    </Collapse>
                );
            });
        }

        return (
            <div>
                <div className = 'row'>
                    <form onSubmit = {this.handleFilterFormSubmit}>
                        {
                            textFilter || brandNameFilter ?
                                <h4 style = {{display: 'inline-block'}}>
                                    {
                                        '查询条件［材料关键字：' +
                                        (textFilter || '无限制') +
                                        '  品牌：' + (brandNameFilter || '无限制') +
                                        '］'
                                    }
                                </h4> :
                                <span>共&nbsp;&nbsp;{moduleList.length}&nbsp;&nbsp;个模块</span>
                        }
                        <button
                            className = 'btn btn-info btn-sm pull-right'
                            style = {{marginRight: '10px'}}
                            >
                            查询
                        </button>
                        <div
                            className = {getColClass(4, 4, 'pull-right form-group')}
                            style = {{marginRight: '15px'}}
                            >
                            <input
                                type = 'text'
                                className = 'form-control'
                                placeholder = '请输入材料名关键字'
                                name = 'textFilter'
                                />
                        </div>
                        <div className = 'btn-group pull-right dropdown'>
                            <Select
                                name = 'brandNameFilter'
                                defaultOptionText = '不限制品牌'
                                defaultOptionValue = ''
                                text = 'item.brandName'
                                value = 'item.brandName'
                                optionList = {brandList}
                                onChange = {() => {}}
                                />
                        </div>
                    </form>
                </div>
                {moduleCollapseList}
            </div>
        );
    }
}

export default connect(state => ({
    moduleList: state.moduleList,
    brandList: state.brandList,
    textFilter: state.filter.textFilter,
    brandNameFilter: state.filter.brandNameFilter
}))(Preview);
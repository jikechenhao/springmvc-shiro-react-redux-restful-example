import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { queryMaterialForPreview } from 'js/redux/actions/module';

import Table from 'js/components/table/Table';

class PreviewTable extends React.Component {
    shouldComponentUpdate(nextProps, nextState) {
        const { module, textFilter, brandNameFilter } = this.props;
        return module !== nextProps.module ||
            textFilter !== nextProps.textFilter ||
            brandNameFilter != nextProps.brandNameFilter;
    }

    componentDidMount() {
        const { module, dispatch } = this.props;
        if (!module.materialList) {
            dispatch(queryMaterialForPreview(module));
        }
    }

    render() {
        const { module, textFilter, brandNameFilter}  = this.props;
        const tb = {
            data: module.materialList,
            key: 'item.materialId + \'-\' + item.spId',
            caption: module.moduleName,
            captionStyle: {color: 'lightcoral', fontSize: 'larger'},
            header: [
                '序号', '材料名称', '规格/型号', '品牌', '单位', '数量'],
            wRate: [1, 4, 8, 3, 2, 2],
            onFilter: item => {
                let valid = true;
                if (textFilter) {
                    valid = -1 < item.materialName.indexOf(textFilter);
                }
                if (brandNameFilter) {
                    valid = valid && -1 < item.brandName.indexOf(brandNameFilter);
                }
                return valid;
            },
            row: ['index + 1', 'item.materialName', 'item.spName', 'item.brandName', 'item.unit', 'item.contractAmount'],
        };

        return (
            <Table tb = {tb}/>
        );
    }
}

export default connect(state => ({
    textFilter: state.filter.textFilter,
    brandNameFilter: state.filter.brandNameFilter
}))(PreviewTable);
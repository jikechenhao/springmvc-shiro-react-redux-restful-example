import React from 'react';

import Table from 'js/components/table/Table';

class ConfirmedPurchaseTable extends React.Component {
    render() {
        const { module } = this.props;
        const tb = {
            data: module.confirmedPurchaseList,
            key: 'item.spId',
            caption: null,
            header: ['序号', '材料名称', '规格型号', '品牌', '单位', '合同数量', '预算数量', '到货数量', '损耗率'],
            rowClassFunc: item => (item.applyAmount !== item.arrivedAmount ? 'warning' : ''),
            row: [
                'index + 1', 'item.materialName', 'item.spName',
                'item.brandName', 'item.unit', 'item.contractAmount',
                'item.applyAmount', 'item.arrivedAmount',
                'Math.round((item.arrivedAmount - item.applyAmount) / item.applyAmount * 10000) / 100 + \'%\''
            ]
        };

        return (<Table tb = {tb}/>);
    }
}

export default ConfirmedPurchaseTable;

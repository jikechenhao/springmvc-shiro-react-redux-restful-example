import React from 'react';

import Table from 'js/components/table/Table';

class ConfirmedPurchaseTable extends React.Component {
    render () {
        const { module } = this.props;
        const tb = {
            data: module.confirmedPurchaseList,
            key: 'item.spId',
            caption: null,
            header: ['序号', '材料名称', '规格型号', '品牌', '单位', '申请数量', '到货数量', '未到货量', '单价', '总金额', '供应商'],
            rowClassFunc: item => (item.applyAmount !== item.arrivedAmount ? 'warning' : ''),
            row: ['index + 1', 'item.materialName', 'item.spName',
                'item.brandName', 'item.unit', 'item.applyAmount',
                'item.arrivedAmount', 'item.applyAmount - item.arrivedAmount',
                'item.unitPrice', 'item.totalCost', 'item.supplier'
            ]
        };

        return (<Table tb = {tb} />);
    }
}

export default ConfirmedPurchaseTable;
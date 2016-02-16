import React from 'react';

class TableRow extends React.Component {
    shouldComponentUpdate(nextProps, nextState) {
        let shouldUpdate = false;
        const { shouldRowUpdate, item, rowClassFunc} = this.props;
        if (shouldRowUpdate) {
            shouldUpdate = shouldRowUpdate(this.props, nextProps);
        }
        return (item !== nextProps.item) || (rowClassFunc !== nextProps.rowClassFunc) || shouldUpdate;
    }

    render() {
        const tdList = [];
        const { item, rowIndex, colFuncList, rowClassFunc } = this.props;
        const rowClass = rowClassFunc ? rowClassFunc(this.props.item) : [];
        colFuncList.forEach((colFunc, index) => {
            tdList.push(
                <td key = {index}>{colFunc(item, rowIndex, rowClass)}</td>
            );
        });
        return (
            <tr className = {rowClass}>
                {tdList}
            </tr>
        );
    }
}

export default TableRow;
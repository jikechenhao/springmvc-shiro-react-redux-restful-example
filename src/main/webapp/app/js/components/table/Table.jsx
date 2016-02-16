import React from 'react';

import TableHeader from './TableHeader';
import TableRow from './TableRow';

import FuncGenerateUtil from '../util/FuncGenerateUtil';

class Table extends React.Component {
    constructor(props) {
        super(props);
        this.rowFuncList = [];
        this.getKey = null;
    }

    componentWillMount() {
        const tb = this.props.tb;

        this.colFuncList = FuncGenerateUtil.generate(tb.row);
        this.getKey = FuncGenerateUtil.generate([tb.key])[0];
    }

    render() {
        const tb = this.props.tb;
        if (!tb) {
            return null;
        }

        const rowList = [];
        let tdList = [];
        const { getKey, colFuncList } = this;
        if (tb.data) {
            tb.data.forEach((item, index) => {
                if (tb.onFilter && !tb.onFilter(item, index)) {
                    return;
                }
                rowList.push(
                    <TableRow
                        key = {getKey(item, index)}
                        shouldRowUpdate = {tb.shouldRowUpdate}
                        colFuncList = {colFuncList}
                        item = {item}
                        rowIndex = {index}
                        rowClassFunc = {tb.rowClassFunc}
                        />
                );
                tdList = [];
            });
        }
        return (
            <table
                className = 'table table-bordered table-hover'
                style = {this.props.center ? {textAlign: 'center'} : {}}
                >
                <caption style = {tb.captionStyle}>
                    {tb.caption}
                </caption>
                <thead>
                <TableHeader
                    header = {tb.header}
                    thClass = {tb.thClass}
                    wRate = {tb.wRate}
                    />
                </thead>
                <tbody>
                {this.props.children}
                {rowList}
                </tbody>
            </table>
        );
    }
}

export default Table;
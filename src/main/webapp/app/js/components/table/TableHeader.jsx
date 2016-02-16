import React from 'react';

/**
 * 一旦表头生成以后再也不会更新了
 */
class TableHeader extends React.Component {
    constructor(props) {
        super(props);
        this.headerList = [];
    }

    componentWillMount() {
        const { headerList }= this;
        this.props.header.forEach((item, index) => {
                headerList.push(
                    <th
                        key = {index}
                        className = {
                            item.class ||
                            this.props.thClass ||
                            this.props.wRate ?
                            'col-lg-' + this.props.wRate[index] + ' col-mg-' + this.props.wRate[index] + ' col-sm-' + this.props.wRate[index] + ' col-xs-' + this.props.wRate[index] :
                            null
                            }
                        >
                        {item.content || item}
                    </th>
                );
            }
        )
    }


    render() {
        return (
            <tr>
                {this.headerList}
            </tr>
        );
    }
}

export default TableHeader;
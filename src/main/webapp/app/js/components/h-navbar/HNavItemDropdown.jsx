import React from 'react';

import Collapse from 'react-collapse';

class HNavItemDropdown extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            open: false
        };

        this.handleItemClick = this.handleItemClick.bind(this);
    }

    handleItemClick(event) {
        this.setState({open: !this.state.open});
    }

    render() {
        const itemClass = this.props.className + ' dropdown';
        return (
            <li className = {itemClass} onClick = {this.handleItemClick}>
                <a className = "dropdown-toggle">
                    <span className = "pull-left glyphicon glyphicon-user"/>
                    &nbsp;&nbsp;管理员&nbsp;&nbsp;
                    <b className = "caret"></b>
                </a>
                <Collapse isOpened = {this.state.open}>
                    <ul className = "dropdown-menu" style = {{display: 'block', right: 0, left: 'inherit'}}>
                        <span className = "arrow top"></span>
                        <li><a>设置</a></li>
                        <li><a>密码修改</a></li>
                        <li><a><span className = "badge bg-danger pull-right">3</span>通知</a></li>
                        <li><a>帮助</a></li>
                        <li className = "divider"></li>
                        <li><a>退出</a></li>
                    </ul>
                </Collapse>
            </li>
        );
    }
}

module.exports = HNavItemDropdown;
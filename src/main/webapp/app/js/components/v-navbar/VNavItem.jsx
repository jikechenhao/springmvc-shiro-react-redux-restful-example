import React from 'react';
import {Link} from 'react-router';

import Collapse from 'react-collapse';

import './css/nav-style.css';

class VNavItem extends React.Component {
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
        const { subNav, iconBgClass, iconStyle, title, url, children } = this.props;
        const { open } = this.state;
        const iconClass = this.props.iconClass + ' nav-icon ' + (subNav ? '' : 'small-glyphicon');
        const content =
            <span>
                <span className = {iconClass}>
                    <b className = {iconBgClass} style = {iconStyle}></b>
                </span>
                {
                    subNav ? (
                        <span className =
                                  {
                                      open ?
                                          'pull-right small-glyphicon glyphicon glyphicon-menu-up' :
                                          'pull-right small-glyphicon glyphicon glyphicon-menu-down'
                                  }
                            >
                            </span>
                    ) : null
                }
                <span>{title}</span>
            </span>;
        return (
            <li className = {open && !url ? 'active' : ''}>
                {
                    url ? (
                        <Link to = {url} onClick = {this.handleItemClick} activeStyle = {{color: '#277BB8'}}>
                            {content}
                        </Link>) : (
                        <a onClick = {this.handleItemClick}>
                            {content}
                        </a>
                    )
                }
                {
                    subNav ? (
                        <Collapse isOpened = {open}>
                            {children || null}
                        </Collapse>
                    ) : null
                }
            </li>
        );
    }
}

VNavItem.defaultProps = {
    subNav: false,
    iconClass: 'glyphicon glyphicon-menu-right',
    iconBgClass: '',
    iconStyle: {},
    url: null,
};

export default VNavItem;
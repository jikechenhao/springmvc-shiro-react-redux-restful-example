import React from 'react';
import './css/nav-style.css';

class HNav extends React.Component {
    render() {
        const { className, fixed, style, children } = this.props;
        const navClass = className + ' nav navbar navbar-default ' + (!fixed || 'navbar-fixed-top-xs');
        return (
            <div className = 'hnav-container'>
                <ul className = {navClass} style = {style}>
                    {children}
                </ul>
            </div>
        );
    }
}

HNav.defaultProps = {
    className: '',
    navStyle: {},
    fixed: false
};

export default HNav;
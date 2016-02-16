import React from 'react';

import VNavItem from './VNavItem';

import './css/nav-style.css';

class VNav extends React.Component {
    render() {
        return (
            <div className = 'vnav-container'>
                <ul className = 'nav'>
                    {this.props.children}
                </ul>
            </div>
        );
    }
}

export default VNav;
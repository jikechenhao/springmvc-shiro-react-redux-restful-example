import React from 'react';

class HNavHeader extends React.Component {
    render() {
        const { className, style, text} = this.props;
        const headerClass = className + ' navbar-header';
        return (
            <div className = {headerClass}>
                <a className = 'navbar-brand' style = {style}>
                    &nbsp;<span className = 'glyphicon glyphicon-equalizer' aria-hidden = 'true'>&nbsp;</span>
                    {text}
                </a>
            </div>
        );
    }
}

HNavHeader.defaultProps = {
    className: '',
    style: {},
    text: ''
};

export default HNavHeader;
import React from 'react';

class FilterInput extends React.Component {
    constructor(props) {
        super(props);
        this.inputStyle = {
            margin: '0 5px'
        };
    }

    render() {
        const { label, placeholder, onTextFilterChange} = this.props;
        return (
            <div className = 'form-inline'>
                <div className = 'form-group'>
                    <label>{label}</label>
                    <input
                        type = 'text'
                        name = '_filterInput'
                        className = 'form-control'
                        style = {this.inputStyle}
                        placeholder = {placeholder}
                        onChange = {onTextFilterChange}
                        />
                </div>
            </div>
        );
    }
}

FilterInput.defaultProps = {
    placeholder: null,
    onTextFilterChange: null,
};

module.exports = FilterInput;
import React from 'react';

/**
 *
 <TextInput
 name = 'projectName'
 placeholder = '请输入项目名'
 emptyMsg = '请输入项目名'
 outRangeMsg = '项目名最多为45个字符'
 maxLength = '45'
 autoFocus
 required
 />
 */

class TextInput extends React.Component {
    constructor(props) {
        super(props);
        this.state = this.getInitState();

        this.reset = this.reset.bind(this);
        this.validate = this.validate.bind(this);
        this.getInitState = this.getInitState.bind(this);
        this.handleValueChange = this.handleValueChange.bind(this);
    }

    getInitState() {
        return {
            value: this.props.defaultValue,
            fbStatus: '',
            fbIcon: '',
            empty: false,
            outRange: false
        };
    }

    componentDidMount() {
        this.context.form.addComponent(this);
    }

    componentWillUnmount() {
        this.context.form.removeComponent(this);
    }

    validate() {
        return this.handleValueChange({target: {value: this.state.value}});
    }

    reset() {
        this.setState(this.getInitState());
    }

    handleValueChange(event) {
        const value = event.target.value;
        let success = false;
        let state = {
            value: value,
            fbStatus: 'has-error',
            fbIcon: 'glyphicon-remove',
            outRange: false,
            empty: false
        };
        if (this.props.required && !value.trim()) {
            state.empty = true;
        } else if (this.props.maxLength && this.props.maxLength < value.length) {
            state.outRange = true;
        } else {
            state.fbStatus = 'has-success';
            state.fbIcon = 'glyphicon-ok';
            success = true;
        }

        this.setState(state);
        return success;
    }

    render() {
        const { type, name, defaultValue, placeholder, autoFocus, emptyMsg, outRangeMsg } = this.props;
        const { fbStatus, fbIcon, value, empty, outRange } = this.state;

        return (
            <div className = {'has-feedback ' + fbStatus}>
                <input
                    type = {type}
                    className = 'form-control'
                    name = {name}
                    value = {value}
                    onChange = {this.handleValueChange}
                    defaultValue = {defaultValue}
                    placeholder = {placeholder}
                    autoFocus = {autoFocus}
                    />
                <i className = {'form-control-feedback glyphicon ' + fbIcon}></i>
                {empty ? <small className = 'help-block'>{emptyMsg}</small> : null}
                {outRange ? <small className = 'help-block'>{outRangeMsg}</small> : null}
            </div>
        )
    }
}

TextInput.contextTypes = {
    form: React.PropTypes.object
};

TextInput.defaultProps = {
    defaultValue: '',
    type: 'text',
    emptyMsg: '请输入该字段',
    outRangeMsg: ''
};

export default TextInput;
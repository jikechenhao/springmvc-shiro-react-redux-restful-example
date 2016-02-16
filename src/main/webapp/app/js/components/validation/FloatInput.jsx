import React from 'react';

/**
 *
 <FloatInput
 name = 'contractNo'
 placeholder = '请输入合同编号'
 notFloatMsg = '请在此处输入数值型数据'
 emptyMsg = '请输入合同编号'
 outMaxRangeMsg = '最大100'
 outMinRangeMsg = '最小0'
 max = {100}
 min = {0}
 required
 />
 */

class FloatInput extends React.Component {
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
            notFloat: false,
            empty: false,
            outMaxRange: false,
            outMinRange: false
        }
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
        let value = event.target.value;
        let success = false;
        let state = {
            value: value,
            fbStatus: 'has-error',
            fbIcon: 'glyphicon-remove',
            notFloat: false,
            empty: false,
            outMaxRange: false,
            outMinRange: false
        };
        const separator = this.props.separator || '.';
        if (separator != '.') {
            value = value.replace(separator, '.');
        }

        if (this.props.required && !value.trim()) {
            state.empty = true;
        } else if (isNaN(parseFloat(value)) || !isFinite(value)) {
            state.notFloat = true;
        } else if ((this.props.max || 0 == this.props.max) && this.props.max < parseFloat(value)) {
            state.outMaxRange = true;
        } else if ((this.props.min || 0 == this.props.min) && this.props.min > parseFloat(value)) {
            state.outMinRange = true;
        } else {
            state.fbStatus = 'has-success';
            state.fbIcon = 'glyphicon-ok';
            success = true;
        }

        this.setState(state);
        return success;
    }

    render() {
        const { name, defaultValue, placeholder, autoFocus, emptyMsg, notFloatMsg, outMaxRangeMsg, outMinRangeMsg } = this.props;
        const { fbStatus, fbIcon, value, empty, notFloat, outMaxRange, outMinRange } = this.state;
        return (
            <div className = {'has-feedback ' + fbStatus}>
                <input
                    type = 'text'
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
                {notFloat ? <small className = 'help-block'>{notFloatMsg}</small> : null}
                {outMaxRange ? <small className = 'help-block'>{outMaxRangeMsg}</small> : null}
                {outMinRange ? <small className = 'help-block'>{outMinRangeMsg}</small> : null}
            </div>
        )
    }
}

FloatInput.defaultProps = {
    defaultValue: '',
    emptyMsg: '请输入该字段',
    notFloatMsg: '请在此处输入数值型数据',
    outMaxRangeMsg: '',
    outMinRangeMsg: ''
};

FloatInput.contextTypes = {
    form: React.PropTypes.object
};

export default FloatInput;
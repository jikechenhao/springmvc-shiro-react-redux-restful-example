import React from 'react';

/**
 *
 <IntInput
 name = 'contractNo'
 placeholder = '请输入合同编号'
 notIntMsg = '请输入纯数字'
 emptyMsg = '请输入合同编号'
 outMaxRangeMsg = '最大100'
 outMinRangeMsg = '最小0'
 max = {100}
 min = {0}
 required
 />
 */

class IntInput extends React.Component {
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
            notInt: false,
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
        const value = event.target.value;
        const reg = /^(?:-?(?:0|[1-9][0-9]*))$/;
        let success = false;
        let state = {
            value: value,
            fbStatus: 'has-error',
            fbIcon: 'glyphicon-remove',
            notInt: false,
            empty: false,
            outMaxRange: false,
            outMinRange: false
        };
        if (this.props.required && !value) {
            state.empty = true;
        } else if (!reg.test(value)) {
            state.notInt = true;
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
        const { name, defaultValue, placeholder, autoFocus, emptyMsg, notIntMsg, outMaxRangeMsg, outMinRangeMsg } = this.props;
        const { fbStatus, fbIcon, value, empty, notInt, outMaxRange, outMinRange } = this.state;

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
                {notInt ? <small className = 'help-block'>{notIntMsg}</small> : null}
                {outMaxRange ? <small className = 'help-block'>{outMaxRangeMsg}</small> : null}
                {outMinRange ? <small className = 'help-block'>{outMinRangeMsg}</small> : null}
            </div>
        )
    }
}

IntInput.defaultProps = {
    defaultValue: '',
    emptyMsg: '请输入该字段',
    notIntMsg: '请在此处输入纯数字',
    outMaxRangeMsg: '',
    outMinRangeMsg: ''
};

IntInput.contextTypes = {
    form: React.PropTypes.object
};

export default IntInput;
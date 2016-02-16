import React from 'react';

import FuncGenerateUtil from '../util/FuncGenerateUtil';

class Select extends React.Component {
    constructor(props) {
        super(props);
        this.state = this.getInitState();
        this.valueFunc = null;
        this.textFunc = null;

        this.reset = this.reset.bind(this);
        this.validate = this.validate.bind(this);
        this.getInitState = this.getInitState.bind(this);
        this.handleValueChange = this.handleValueChange.bind(this);
    }

    getInitState() {
        return {
            value: null,
            fbStatus: '',
            fbIcon: '',
            empty: false
        }
    }

    componentWillMount() {
        const { value, text } = this.props;
        this.valueFunc = value ? FuncGenerateUtil.generate([value])[0] : null;
        this.textFunc = text ? FuncGenerateUtil.generate([text])[0] : null;
    }

    componentDidMount() {
        !this.context.form || this.context.form.addComponent(this);
    }

    componentWillUnmount() {
        !this.context.form || this.context.form.removeComponent(this);
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
            empty: false
        };
        if (this.props.required && !value) {
            state.empty = true;
        } else {
            state.fbStatus = 'has-success';
            state.fbIcon = 'glyphicon-ok';
            success = true;
        }

        this.setState(state);
        return success;
    }

    render() {
        const optionList = [];
        const { valueFunc, textFunc } = this;
        const { name, emptyMsg, defaultOptionText, defaultOptionValue, onChange } = this.props;
        const { fbStatus, fbIcon, empty } = this.state;
        this.props.optionList.forEach((item, index) => {
            optionList.push(
                <option
                    value = {valueFunc ? valueFunc(item) : item}
                    key = {index}
                    >
                    {textFunc ? textFunc(item) : item}
                </option>
            );
        });
        return (
            <div className = {'has-feedback ' + fbStatus}>
                <select
                    name = {name}
                    className = 'form-control'
                    onChange = {onChange || this.handleValueChange}
                    >
                    <option value = {defaultOptionValue || ''}>{defaultOptionText || ''}</option>
                    {optionList}
                </select>
                <i className = {'form-control-feedback glyphicon ' + fbIcon}></i>
                {empty ? <small className = 'help-block'>{emptyMsg}</small> : null}
            </div>
        )
    }
}

Select.defaultProps = {
    emptyMsg: '请选择一项'
};

Select.contextTypes = {
    form: React.PropTypes.object
};

export default Select;
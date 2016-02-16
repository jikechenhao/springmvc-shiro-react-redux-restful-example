import React from 'react';

class FileInput extends React.Component {
    constructor(props) {
        super(props);
        this.state = this.getInitState();

        this.getInitState = this.getInitState.bind(this);
        this.validate = this.validate.bind(this);
        this.reset = this.reset.bind(this);
        this.handleFileChange = this.handleFileChange.bind(this);
    }

    getInitState() {
        return {
            value: '',
            fbStatus: '',
            fbIcon: '',
            empty: false,
            invalidType: false
        };
    }

    componentDidMount() {
        this.context.form.addComponent(this);
    }

    componentWillUnmount() {
        this.context.form.removeComponent(this);
    }

    validate() {
        return this.handleFileChange({target: {value: this.state.value}});
    }

    reset() {
        this.setState(this.getInitState());
    }

    handleFileChange(event) {
        const { value } = event.target;
        const extension = value.substring(value.lastIndexOf('.'));
        let success = false;
        let state = {
            value: value,
            fbStatus: 'has-error',
            fbIcon: 'glyphicon-remove',
            empty: false,
            invalidType: false
        };
        if (!value.trim()) {
            state.empty = true;
        } else if (-1 >= this.props.validExtensions.indexOf(extension)) {
            state.invalidType = true;
            state.value = '';
        } else {
            state.fbStatus = 'has-success';
            state.fbIcon = 'glyphicon-ok';
            success = true;
        }

        this.setState(state);
        return success;
    }

    render() {
        const { wrapperClassName, name, placeholder, emptyMsg, invalidTypeMsg } = this.props;
        const { fbStatus, fbIcon, value, empty, invalidType } = this.state;
        return (
            <div className = {wrapperClassName + ' has-feedback ' + fbStatus}>
                <input
                    type = 'file'
                    className = 'form-control'
                    name = {name}
                    value = {value}
                    onChange = {this.handleFileChange}
                    placeholder = {placeholder}
                    />
                <i className = {'form-control-feedback glyphicon ' + fbIcon}></i>
                {empty ? <small className = 'help-block'>{emptyMsg}</small> : null}
                {invalidType ? <small className = 'help-block'>{invalidTypeMsg}</small> : null}
            </div>
        );
    }
}

FileInput.defaultProps = {
    validExtensions: [],
    wrapperClassName: '',
    emptyMsg: '请选择要上传的文件',
    invalidTypeMsg: '请选择正确类型的文件'
};

FileInput.contextTypes = {
    form: React.PropTypes.object
};

export default FileInput;
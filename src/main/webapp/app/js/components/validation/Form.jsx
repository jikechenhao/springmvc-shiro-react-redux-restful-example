import React from 'react';

class Form extends React.Component {
    constructor(props) {
        super(props);
        this.state = {componentList: []};

        this.addComponent = this.addComponent.bind(this);
        this.removeComponent = this.removeComponent.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleReset = this.handleReset.bind(this);
    }

    getChildContext() {
        return {
            form: {
                addComponent: this.addComponent,
                removeComponent: this.removeComponent
            }
        }
    }

    addComponent(component) {
        if (-1 >= this.state.componentList.indexOf(component)) {
            this.state.componentList.push(component);
        }
    }

    removeComponent(component) {
        if (-1 >= this.state.componentList.indexOf(component)) {
            this.state.componentList.splice(this.state.componentList.indexOf(component), 1);
        }
    }

    handleSubmit(event) {
        if (this.props.preventDefault) {
            event.preventDefault();
        }
        let pass = this.state.componentList.every(component => {
            return component.validate();
        });
        pass ? this.props.onSubmit(event) : event.preventDefault();
    }

    handleReset() {
        this.state.componentList.forEach(component => component.reset());
    }

    render() {
        const { className, action, target, encType, method, children } = this.props;
        return (
            <form
                className = {className ? className : 'form-horizontal'}
                action = {action}
                target = {target}
                encType = {encType}
                method = {method}
                onSubmit = {this.handleSubmit}
                onReset = {this.handleReset}
                >
                {children}
            </form>
        )
    }
}

Form.defaultProps = {preventDefault: true};
Form.childContextTypes = {form: React.PropTypes.object};

export default Form;
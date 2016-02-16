import React from 'react';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group';

class Collapse extends React.Component {
    constructor(props) {
        super(props);
        this.state = {opened: this.props.opened || false};
    }

    render() {
        return (
            <div className = 'panel-group' role = 'tablist' aria-multiselectable = 'true'>
                <div className = {'panel panel-' + (this.props.panelType || (this.state.opened ? 'info' : 'default'))}>
                    <div
                        className = 'panel-heading'
                        onClick = {() => this.setState({opened: !this.state.opened})}
                        role = 'tab'
                        style = {{cursor: 'pointer'}}
                        >
                        <h4 className = 'panel-title'>
                            {this.props.header}
                        </h4>
                    </div>
                    <div className = {
                        this.state.opened ?
                        'panel-collapse animate-wrapper animate' :
                        'panel-collapse animate-wrapper'
                        }>
                        <ReactCSSTransitionGroup
                            transitionName = 'animateHeight'
                            transitionEnterTimeout = {500}
                            transitionLeaveTimeout = {500}
                            >
                            {
                                this.state.opened ?
                                    (
                                        <div>
                                            <div className = 'panel-body'>
                                                {this.props.children}
                                            </div>
                                        </div>
                                    ) :
                                    null
                            }
                        </ReactCSSTransitionGroup>
                    </div>
                </div>
            </div>
        );
    }
}

export default Collapse;
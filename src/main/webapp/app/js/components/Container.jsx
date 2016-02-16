import React from 'react';
import { connect } from 'react-redux';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group';

import Header from 'js/components/Header';
import Message from 'js/components/Message';

import { getColClass } from 'js/util/styleUtil';

import 'css/base.css';
import 'css/animate.css';

class Container extends React.Component {
    constructor(props) {
        super(props);
        this.baseStyle = {
            margin: '0',
            padding: '0',
            height: '100%'
        };
        this.messageStyle = {
            position: 'fixed',
            top: this.props.top || '30px',
            right: this.props.right || '0px',
            zIndex: 9999,
            overflow: 'hidden'
        };
    }

    render() {
        const messageList = [];
        const { container } = this.props;
        for (var prop in container.messageContainer) {
            if (container.messageContainer.hasOwnProperty(prop)) {
                messageList.push(<Message message = {container.messageContainer[prop]}
                                          key = {container.messageContainer[prop].key}/>);
            }
        }
        return (
            <div className = 'container-fluid' style = {this.baseStyle}>
                <ReactCSSTransitionGroup
                    transitionName = 'animateRight'
                    transitionEnterTimeout = {300}
                    transitionLeaveTimeout = {300}
                    style = {this.messageStyle}
                    >
                    {messageList}
                </ReactCSSTransitionGroup>

                <div className = 'row bg'>
                    <div className = {container.showImg ? 'panel-collapse animate-wrapper animate' : 'panel-collapse'}>
                        <ReactCSSTransitionGroup
                            transitionName = 'animate'
                            transitionEnterTimeout = {300}
                            transitionLeaveTimeout = {300}
                            >
                            {
                                container.showImg ?
                                    (
                                        <div className = {getColClass(20, 20)}>
                                            <img className = 'img-responsive' src = 'image/1-1.jpg'/>
                                        </div>
                                    ) : null
                            }
                        </ReactCSSTransitionGroup>
                    </div>
                    <Header showImg = {container.showImg} navList = {container.nav}/>

                    <div className = {getColClass(20, 20, 'tableContainer')}>
                        {this.props.children}
                    </div>

                    <ReactCSSTransitionGroup
                        transitionName = 'animate'
                        transitionEnterTimeout = {300}
                        transitionLeaveTimeout = {300}
                        style = {{position: 'fixed', zIndex: 2050}}
                        >
                        {container.modal}
                    </ReactCSSTransitionGroup>
                </div>
            </div>
        );
    }
}

export default connect(state => ({container: state.container}))(Container);
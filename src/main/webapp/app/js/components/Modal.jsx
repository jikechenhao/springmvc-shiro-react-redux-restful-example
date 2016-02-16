import React from 'react'

import Form from 'js/components/validation/Form'
import Draggable from 'react-draggable'

var Modal = React.createClass({
    getDefaultProps: function () {
        return {
            disabled: false
        }
    },
    render: function () {
        var drags = {onStart: this.onStart, onStop: this.onStop};
        return (
            <div className = 'modal' style = {{background: 'rgba(0, 0, 0, 0.5)'}}>
                <Form onSubmit = {this.props.onFormSubmit} preventDefault = {true}>
                    <Draggable handle = '.modal-header .modal-title' start = {{x: 0, y: 0}} {...drags}>
                        <div className = 'modal-dialog'>
                            <div className = 'modal-content'>
                                <div className = 'modal-header' style = {{cursor: 'pointer'}}>
                                    <button type = 'button' className = 'close' aria-label = 'Close'
                                            onClick = {this.props.onCloseClick}><span
                                        aria-hidden = 'true'>&times;</span>
                                    </button>
                                    <h4 className = 'modal-title'>{this.props.title}</h4>
                                </div>
                                <div className = 'modal-body'>
                                    {this.props.children}
                                </div>
                                <div className = 'modal-footer'>
                                    <button type = 'button' className = 'btn btn-default'
                                            onClick = {this.props.onCloseClick}>
                                        关闭
                                    </button>
                                    {
                                        this.props.disabled ?
                                            null :
                                            <button type = 'submit' className = 'btn btn-primary'>确定</button>

                                    }
                                </div>
                            </div>
                        </div>
                    </Draggable>
                </Form>
            </div>
        )
    }
});

module.exports = Modal;
import React from 'react';

import Form from 'js/components/validation/Form';
import Draggable from 'react-draggable';

class Modal extends React.Component {
    render() {
        const { onFormSubmit, onCloseClick, title, titleStyle, children, confirmable = true, closeable = true } = this.props;
        const drags = {onStart: this.onStart, onStop: this.onStop};
        return (
            <div className = 'modal' style = {{background: 'rgba(0, 0, 0, 0.5)'}}>
                <Form onSubmit = {onFormSubmit} preventDefault = {true}>
                    <Draggable handle = '.modal-header .modal-title' start = {{x: 0, y: 0}} {...drags}>
                        <div className = 'modal-dialog'>
                            <div className = 'modal-content'>
                                <div className = 'modal-header' style = {{cursor: 'pointer'}}>
                                    {
                                        closeable ?
                                            <button
                                                type = 'button'
                                                className = 'close'
                                                aria-label = 'Close'
                                                onClick = {onCloseClick}
                                                >
                                                <span aria-hidden = 'true'>&times;</span>
                                            </button> :
                                            null
                                    }
                                    <h4 className = 'modal-title'
                                        style = {titleStyle}>{title}</h4>
                                </div>
                                <div className = 'modal-body'>
                                    {children}
                                </div>
                                <div className = 'modal-footer'>
                                    {
                                        closeable ?
                                            <button
                                                type = 'button'
                                                className = 'btn btn-default'
                                                onClick = {onCloseClick}
                                                >
                                                关闭
                                            </button> :
                                            null
                                    }
                                    {
                                        confirmable ?
                                            <button type = 'submit' className = 'btn btn-primary'>确定</button> :
                                            null
                                    }
                                </div>
                            </div>
                        </div>
                    </Draggable>
                </Form>
            </div>
        )
    }
}

Modal.defaultProps = {
    disabled: false,
};

module.exports = Modal;
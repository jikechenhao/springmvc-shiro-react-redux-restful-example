import React from 'react';

import Modal from 'js/components/common/Modal';

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class ProcessingModal extends React.Component {
    render() {
        const { message,} = this.props;
        return (
            <div className = 'modal' style = {{background: 'rgba(0, 0, 0, 0.5)'}}>
                    <div
                        className = "progress"
                        style = {{width: '50%', margin: 'auto', position: 'absolute', top: 0, left: 0, right: 0, bottom: 0}}>
                        <div
                            className = "progress-bar progress-bar-info progress-bar-striped active"
                            role = "progressbar"
                            aria-valuenow = "45"
                            aria-valuemin = "0"
                            aria-valuemax = "100"
                            style = {{width: '100%'}}
                            >
                            {message || '进行中'}
                        </div>
                </div>
            </div>
        )
    }
}

export default ProcessingModal;
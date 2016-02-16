import React from 'react';
import { connect} from 'react-redux';

import { closeModal } from 'js/redux/actions/container';

import Modal from 'js/components/common/Modal';
import TextInput from 'js/components/validation/TextInput'

import { getColClass, getOffsetClass } from 'js/util/styleUtil';

class ConfirmModal extends  React.Component {
    render () {
        const { dispatch, callback, target, title, confirmable, body } = this.props;
        return (
            <Modal
                title = {title}
                onCloseClick = {() => dispatch(closeModal())}
                onFormSubmit = {event => callback(event, target)}
                confirmable = {confirmable}
                >
                {body ? body : '是否确定进行该操作?'}
            </Modal>
        )
    }
}

export default connect(state => ({}))(ConfirmModal);
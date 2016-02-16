import React from 'react';
import { connect } from 'react-redux';

import { closeMessage} from 'js/redux/actions/container';

class Message extends React.Component {
    componentDidMount() {
        setTimeout(() => this.props.dispatch(closeMessage(this.props.message.key)), this.props.message.interval || 3000);
    }

    render() {
        const { dispatch } = this.props;
        return (
            <div
                className = {'alert ' + (this.props.message.success ? 'alert-success' : 'alert-danger')}
                role = 'alert'
                >
                <button
                    className = 'close'
                    onClick = {() => dispatch(closeMessage(this.props.message.key))}
                    >
                    <span aria-hidden = 'true'>&times;</span>
                </button>
                <strong>提示:&nbsp;&nbsp;</strong>
                <label>{this.props.message.content}</label>
            </div>
        )
    }
}

export default connect(state => ({}))(Message);
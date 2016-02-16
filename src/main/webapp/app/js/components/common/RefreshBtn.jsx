import React from 'react';

class RefreshBtn extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            loading: false
        };
        this.handleRefresh = this.handleRefresh.bind(this);
    }

    handleRefresh() {
        this.setState({loading: true});
        this.props.onRefresh(function () {
            this.setState({loading: false});
        }.bind(this));
    }

    render() {
        return (
            <div
                className = {this.props.className}
                style = {{height: '34px'}}>
                {
                    this.state.loading ?
                        <img
                            style = {{height: '100%', width: 'auto'}}
                            src = '/image/loading.gif'
                            /> :
                        <button
                            className = 'btn btn-default'
                            onClick = {this.handleRefresh}
                            >
                        <span
                            className = 'glyphicon glyphicon-refresh'
                            >
                        </span>
                        </button>
                }
            </div>
        );
    }
}

export default RefreshBtn;
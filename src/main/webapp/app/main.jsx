import React, { Component } from 'react'
import { render } from 'react-dom';
import { Router, useRouterHistory } from 'react-router';
import { Provider } from 'react-redux';
import { history } from 'js/routes/routeUtil';
import { store } from './js/redux';
import injectTapEventPlugin from 'react-tap-event-plugin';
import createHashHistory from 'history/lib/createHashHistory';

injectTapEventPlugin();

import LoginForm from './Login';
import Container from 'js/components/Container';
const rootRoute = {
    path: '/',
    component: Container,
    indexRoute: {
        component: LoginForm
    },
    childRoutes: [{
        childRoutes: [
            require('js/routes/Admin'),
            require('js/routes/PM'),
            require('js/routes/Purchase'),
            require('js/routes/Storage'),
            require('js/routes/Boss')
        ]
    }]
};

history.set(useRouterHistory(createHashHistory)({queryKey: false}));

import { loadUserInfo } from 'js/redux/actions/user';
store.dispatch(loadUserInfo());

class Root extends Component {
    render() {
        return (
            <Provider store = {store}>
                <Router history = {history.get()} routes = {rootRoute}/>
            </Provider>
        );
    }
}

render(
    <Root />,
    document.getElementById('container')
);

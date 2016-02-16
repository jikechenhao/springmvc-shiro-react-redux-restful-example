import { createStore, applyMiddleware, compose } from 'redux';
import middleware from './middleware';
import reducer from './reducer';

let finalCreateStore = null;

if (__DEVELOPMENT__) {
    finalCreateStore= compose(
        applyMiddleware.apply(this, middleware),
        //启用chrome的redux devtool插件
        window.devToolsExtension ? window.devToolsExtension() : f => f
    )(createStore);
} else {
    finalCreateStore = compose(
        applyMiddleware.apply(this, middleware)
    )(createStore);
}

export const store = finalCreateStore(reducer);
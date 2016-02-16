import ActionTypes from 'js/constants/constants';

const initialState = {
    modal: null,
    messageContainer: {},
    showImg: false,
    navList: []
};

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.SHOW_MODAL:
            return {...state, modal: payload};
        case ActionTypes.CLOSE_MODAL:
            return {...state, modal: null};
        case ActionTypes.SHOW_MESSAGE:
        {
            const key = Object.getOwnPropertyNames(state.messageContainer).length + 1;
            const newState = {...state};
            newState.messageContainer[key] = {
                success: payload.success,
                content: payload.message,
                key: key,
                interval: 3000
            };
            return newState;
        }
        case ActionTypes.CLOSE_MESSAGE:
        {
            const newState = {...state};
            delete newState.messageContainer[payload];
            return newState;
        }
        case ActionTypes.TOGGLE_IMG_SHOW:
            return {...state, showImg: !state.showImg};
        case ActionTypes.UPDATE_NAV:
            return {...state, navList: payload};
        default:
            return state;
    }
}
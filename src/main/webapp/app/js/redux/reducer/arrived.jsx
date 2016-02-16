import ActionTypes from 'js/constants/constants';

const initialState = [];

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.QUERY_ARRIVED:
            return [...payload.entity];
        case ActionTypes.RESET_ARRIVED:
            return [];
        default:
            return state;
    }
}
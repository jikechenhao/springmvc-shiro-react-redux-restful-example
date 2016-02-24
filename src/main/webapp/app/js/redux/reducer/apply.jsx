import ActionTypes from 'js/constants/constants';

const initialState = [];

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.PUT_APPLY:
        {
            const newState = [...state];
            newState.push(payload);
            return newState;
        }
        case ActionTypes.REMOVE_APPLY:
        {
            const newState = [...state];
            const index = state.indexOf(payload);
            if (-1 < index) {
                newState.splice(index, 1);
            }
            return newState;
        }
        case ActionTypes.RESET_APPLY:
            return [];
        default:
            return state;
    }
}
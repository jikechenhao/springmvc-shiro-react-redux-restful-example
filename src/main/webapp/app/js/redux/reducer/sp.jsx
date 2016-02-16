import ActionTypes from 'js/constants/constants';

const initialState = [];

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.QUERY_SP:
            return [...payload.entity];
        case ActionTypes.DELETE_SP:
        {
            const newState = [...state];
            if (state.includes(payload)) {
                newState.splice(state.indexOf(payload), 1);
            }
            return newState;
        }
        case ActionTypes.UPDATE_SP:
        {
            const newState = [...state];
            const { sp, newSp } = payload;
            const index = state.indexOf(sp);
            if (-1 < index) {
                newState.splice(index, 1, {...sp, ...newSp});
            }
            return newState;
        }
        case ActionTypes.CREATE_SP:
        {
            const newState = [...state];
            newState.unshift(payload.entity);
            return newState;
        }
        case ActionTypes.RESET_SP:
            return [];
        default:
            return state;
    }
}
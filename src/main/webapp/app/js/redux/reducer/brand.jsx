import ActionTypes from 'js/constants/constants';

const initialState = [];

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.QUERY_BRAND:
            return [...payload.entity];
        case ActionTypes.DELETE_BRAND:
        {
            const newState = [...state];
            if (state.includes(payload)) {
                newState.splice(state.indexOf(payload), 1);
            }
            return newState;
        }
        case ActionTypes.UPDATE_BRAND:
        {
            const newState = [...state];
            const { brand, newBrandName } = payload;
            const index = state.indexOf(brand);
            if (-1 < index) {
                newState.splice(index, 1, {...brand, brandName: newBrandName});
            }
            return newState;
        }
        case ActionTypes.CREATE_BRAND:
        {
            const newState = [...state];
            newState.unshift(payload.entity);
            return newState;
        }
        case ActionTypes.RESET_BRAND:
            return [];
        default:
            return state;
    }
}
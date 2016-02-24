import ActionTypes from 'js/constants/constants';

const initialState = {
    purchaseList: [],
    uncommittedList: [],
    selectedApplyRecord: null
};

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.QUERY_PURCHASE:
            return {...state, purchaseList: payload.entity};
        case ActionTypes.VERIFY_PURCHASE:
        {
            const newState = {...state};
            const index = state.purchaseList.indexOf(payload);
            if (-1 < index) {
                newState.purchaseList.splice(index, 1, {...payload, confirmed: true});
            }
            return newState;
        }
        case ActionTypes.RESET_PURCHASE:
            return {
                purchaseList: [],
                uncommittedList: [],
                selectedApplyRecord: null
            };
        case ActionTypes.RESET_PURCHASE_LIST:
            return {...state, purchaseList: []};
        case ActionTypes.RESET_UNCOMMITTED_LIST:
            return {...state, uncommittedList: []};
        case ActionTypes.PUT_PURCHASE:
        {
            const newState = {...state};
            newState.uncommittedList.push(payload);
            return newState;
        }
        case ActionTypes.REMOVE_PURCHASE:
        {
            const newState = {...state};
            const index = state.uncommittedList.indexOf(payload);
            if (-1 < index) {
                newState.uncommittedList.splice(state.uncommittedList.indexOf(payload), 1);
            }
            return newState;
        }
        case ActionTypes.SELECT_APPLY_RECORD:
            return {...state, selectedApplyRecord: payload};
        case ActionTypes.UNSELECT_APPLY_RECORD:
            return {...state, selectedApplyRecord: null};
        default:
            return state;
    }
}
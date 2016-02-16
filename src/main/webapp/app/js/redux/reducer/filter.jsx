import ActionTypes from 'js/constants/constants';

const initialState = {
    //textFilter为通用的filter
    textFilter: null,
    //brandNameFilter只用在Admin/Preview.jsx中
    brandNameFilter: null,
    //下面三个只用在ConfirmedPurchaseCollapse中
    materialNameFilter: null,
    spNameFilter: null,
    supplierFilter: null
};

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.UPDATE_TEXT_FILTER:
            return {...state, textFilter: payload || null};
        case ActionTypes.UPDATE_BRAND_NAME_FILTER:
            return {...state, brandNameFilter: payload || null};
        case ActionTypes.UPDATE_MATERIAL_NAME_FILTER:
            return {...state, materialNameFilter: payload || null};
        case ActionTypes.UPDATE_SP_NAME_FILTER:
            return {...state, spNameFilter: payload || null};
        case ActionTypes.UPDATE_SUPPLIER_FILTER:
            return {...state, supplierFilter: payload || null};
        case ActionTypes.RESET_FILTER:
            return {};
        default:
            return state;
    }
}
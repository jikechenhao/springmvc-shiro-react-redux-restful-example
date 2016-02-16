import ActionTypes from 'js/constants/constants';

export function updateTextFilter(filterText) {
    return dispatch => dispatch({
        type: ActionTypes.UPDATE_TEXT_FILTER,
        payload: filterText
    });
}

export function updateBrandNameFilter(brandName) {
    return dispatch => dispatch({
        type: ActionTypes.UPDATE_BRAND_NAME_FILTER,
        payload: brandName
    });
}

export function updateMaterialNameFilter(materialName) {
    return dispatch => dispatch({
        type: ActionTypes.UPDATE_MATERIAL_NAME_FILTER,
        payload: materialName.replace(/\n/g, '\r\n')
    });
}

export function updateSpNameFilter(spName) {
    return dispatch => dispatch({
        type: ActionTypes.UPDATE_SP_NAME_FILTER,
        payload: spName.replace(/\n/g, '\r\n')
    });
}

export function updateSupplierFilter(supplier) {
    return dispatch => dispatch({
        type: ActionTypes.UPDATE_SUPPLIER_FILTER,
        payload: supplier.replace(/\n/g, '\r\n')
    });
}
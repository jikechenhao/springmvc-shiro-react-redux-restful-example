import ActionTypes from 'js/constants/constants';

export function createApply(projectId, moduleId, applyList) {
    return dispatch => dispatch({
        type: [, ActionTypes.RESET_APPLY],
        req: {
            method: 'create',
            url: '/order/' + projectId + '/' + moduleId + '/order.json',
            param: applyList
        }
    });
}

export function putApply(material, sp, form) {
    return dispatch => {
        const apply = {
            materialId: material.materialId,
            materialName: material.materialName,
            spId: sp.spId,
            spName: sp.spName,
            unit: sp.unit,
            brandId: form.brand.value.split('-')[0],
            brandName: form.brand.value.split('-')[1],
            applyAmount: form.applyAmount.value,
            comment: form.comment.value,
            applyUser: form.applyUser.value
        };
        dispatch({
            type: ActionTypes.PUT_APPLY,
            payload: apply
        });
        dispatch({type: ActionTypes.CLOSE_MODAL});
    }

}

export function removeApply(apply) {
    return dispatch => dispatch({
        type: ActionTypes.REMOVE_APPLY,
        payload: apply
    });
}

export function resetApplyList(){
    return dispatch => dispatch({type: ActionTypes.RESET_APPLY});
}
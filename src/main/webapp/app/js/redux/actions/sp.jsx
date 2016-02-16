import ActionTypes from 'js/constants/constants';

export function querySp(materialId, callback) {
    return dispatch => dispatch({
        type: [ActionTypes.RESET_SP, [ActionTypes.RESET_FILTER, ActionTypes.QUERY_SP]],
        req: {
            method: 'query',
            url: '/sp/' + materialId + '/sp.json'
        }
    });
}

export function deleteSp(sp) {
    return dispatch => dispatch({
        type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.DELETE_SP]],
        req: {
            method: 'del',
            url: '/sp/sp.json',
            param: {spId: sp.spId}
        },
        payload: sp
    });
}

export function updateSp(form, sp) {
    return dispatch => {
        const [spName, unit, contractAmount] =
            [
                form.spName.value.trim(),
                form.unit.value.trim(),
                form.contractAmount.value.trim()
            ];
        if (!spName || !unit || !contractAmount) {
            return;
        }

        dispatch({
            type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.UPDATE_SP]],
            req: {
                method: 'update',
                url: '/sp/sp.json',
                param: {spId: sp.spId, spName: spName, unit: unit, contractAmount: contractAmount}
            },
            payload: {
                sp: sp,
                newSp: {
                    spName: spName,
                    unit: unit,
                    contractAmount: contractAmount
                }
            }
        });
    }
}

export function createSp(form, materialId) {
    return dispatch => {
        const [ spName, unit, contractAmount, brandName ] =
            [
                form.spName.value.trim(),
                form.unit.value.trim(),
                form.contractAmount.value.trim(),
                form.brandName.value.trim()
            ];
        if (!spName || !unit || !contractAmount || !brandName) {
            return;
        }

        dispatch({
            type: [, ActionTypes.CREATE_SP],
            req: {
                method: 'create',
                url: '/sp/' + materialId + '/sp.json',
                param: {
                    spName: spName,
                    unit: unit,
                    contractAmount: contractAmount,
                    brandName: brandName,
                    materialId: materialId
                }
            },
            onSuccess: () => {
                form.spName.focus();
                form.reset();
            }
        });
    }
}

import ActionTypes from 'js/constants/constants';

export function queryPurchase(applyId) {
    return dispatch => dispatch({
        type: [ActionTypes.RESET_PURCHASE_LIST, ActionTypes.QUERY_PURCHASE],
        req: {
            method: 'query',
            url: '/order/' + applyId + '/purchase.json',
        }
    });
}

export function queryPurchaseByCondition(projectId, listNO, serialNO) {
    return dispatch => {
        dispatch({
            type: [ActionTypes.RESET_PURCHASE_LIST, ActionTypes.QUERY_PURCHASE],
            req: {
                method: 'query',
                url: '/order/' + projectId + '/condition/purchase.json',
                param: {listNO: listNO, serialNO: serialNO}
            }
        });
        dispatch(selectApplyRecord({
            applyId: 0,
            materialName: '根据送货单号查询',
            spName: '送货单号: ' + listNO,
            listNO: listNO,
            serialNO: serialNO
        }));
    }
}

export function verifyPurchase(purchase) {
    return dispatch => dispatch({
        type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.VERIFY_PURCHASE]],
        req: {
            method: 'update',
            url: '/order/' + purchase.purchaseId + '/purchase.json'
        },
        payload: purchase
    });
}

export function createPurchase(projectId, uncommittedList, listNO) {
    return dispatch => {
        uncommittedList.forEach(item => item.listNO = listNO);
        dispatch({
            type: [, ActionTypes.RESET_UNCOMMITTED_LIST],
            req: {
                method: 'create',
                url: '/order/' + projectId + '/order.json',
                param: uncommittedList
            }
        });
    }
}

export function resetPurchase(){
    return dispatch => dispatch({type: ActionTypes.RESET_PURCHASE});
}

export function putPurchase(applyRecord, form) {
    return dispatch => {
        const purchase = {
            materialName: applyRecord.materialName,
            spName: applyRecord.spName,
            brandName: applyRecord.brandName,
            unit: applyRecord.unit,
            applyId: applyRecord.applyId,
            purchaseAmount: form.purchaseAmount.value,
            unitPrice: form.unitPrice.value,
            totalCost: form.totalCost.value,
            supplier: form.supplier.value
        };
        dispatch({
            type: ActionTypes.PUT_PURCHASE,
            payload: purchase
        });
        dispatch({type: ActionTypes.CLOSE_MODAL});
    }
}

export function removePurchase(purchase) {
    return dispatch => dispatch({
        type: ActionTypes.REMOVE_PURCHASE,
        payload: purchase
    });
}

export function selectApplyRecord(applyRecord) {
    return dispatch => {
        dispatch({
            type: ActionTypes.SELECT_APPLY_RECORD,
            payload: applyRecord
        });
        0 >= applyRecord.applyId || dispatch(queryPurchase(applyRecord.applyId));
    };
}

export function unselectApplyRecord() {
    return dispatch => dispatch({
        type: ActionTypes.UNSELECT_APPLY_RECORD,
    });
}

export function download(id, serialNO, listNO, confirmed) {
    return dispatch => dispatch({
        type: [],
        req: {
            method: 'download',
            url: null
        },
        onSuccess: payload => {
            window.open(
                '/order/purchase/excel.json?' +
                (!serialNO && !listNO ? 'applyId=' : 'projectId=') +
                id +
                (serialNO ? '&serialNO=' + serialNO : '') +
                (listNO ? '&listNO=' + listNO : '') +
                (true === confirmed ? '&confirmed=true' : '') +
                '&t=' + payload.entity);
        }
    });
}
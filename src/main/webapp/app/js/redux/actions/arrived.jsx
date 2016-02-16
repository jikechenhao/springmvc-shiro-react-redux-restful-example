import ActionTypes from 'js/constants/constants';

import { queryApplyRecord } from './applyRecord';

export function queryArrived(applyId) {
    return dispatch => dispatch({
        type: [ActionTypes.RESET_ARRIVED, ActionTypes.QUERY_ARRIVED],
        req: {
            method: 'query',
            url: '/order/' + applyId + '/arrived.json',
        }
    });
}

export function updateArrived(applyId, arrivedAmount, purchaseId, module) {
    return dispatch => {
        const arrivedList = [];
        if ('Array' === typeof arrivedAmount) {
            arrivedAmount.forEach((item, index) => {
                arrivedList.push({
                    arrivedAmount: item.value,
                    purchaseId: purchaseId[index].value
                });
            })
        } else {
            arrivedList.push({
                arrivedAmount: arrivedAmount.value,
                purchaseId: purchaseId.value
            });
        }
        dispatch({
            type: [, ActionTypes.CLOSE_MODAL],
            req: {
                method: 'update',
                url: '/order/' + applyId + '/arrived.json',
                param: arrivedList
            },
            onSuccess: () => dispatch(queryApplyRecord(module))
        });
    }
}
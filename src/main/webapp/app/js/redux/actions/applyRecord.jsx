import ActionTypes from 'js/constants/constants';

export function queryApplyRecord(module) {
    return dispatch => dispatch({
        type: [],
        req: {
            method: 'query',
            url: '/order/' + module.moduleId + '/record.json',
            param: {projectId: null, serialNo: null}
        },
        onSuccess: payload => {
            dispatch({
                type: ActionTypes.QUERY_APPLY_RECORD,
                payload: {
                    oldModule: module,
                    applyRecordList: payload.entity
                }
            });
        }
    });
}

export function deleteApplyRecord(module, applyRecord) {
    return dispatch => dispatch({
        type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.DELETE_APPLY_RECORD]],
        req: {
            method: 'del',
            url: '/order/record.json',
            param: {applyId: applyRecord.applyId}
        },
        payload: {
            oldModule: module,
            applyRecord: applyRecord
        }
    });
}

export function download(moduleId) {
    return dispatch => dispatch({
        type: [],
        req: {
            method: 'download',
            url: ''
        },
        onSuccess: payload => {
            window.open('/order/excel.json?moduleId=' + moduleId + '&t=' + payload.entity);
        }
    });
}

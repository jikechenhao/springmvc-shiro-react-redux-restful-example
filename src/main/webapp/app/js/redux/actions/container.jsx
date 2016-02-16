import ActionTypes from 'js/constants/constants';

export function showModal(modal) {
    return (dispatch) => {
        dispatch({
            type: ActionTypes.SHOW_MODAL,
            payload: modal
        });
    };
}

export function closeModal() {
    return (dispatch) => {
        dispatch({
            type: ActionTypes.CLOSE_MODAL
        });
    }
}

export function showMessage(message, success = true, loading = false) {
    return (dispatch) => {
        dispatch({
            type: ActionTypes.SHOW_MESSAGE,
            payload: {
                success: success,
                message: message,
                loading: loading
            }
        });
    }
}

export function closeMessage(messageKey) {
    return (dispatch => {
        dispatch({
            type: ActionTypes.CLOSE_MESSAGE,
            payload: messageKey
        });
    })
}

export function toggleImgShow() {
    return dispatch => {
        dispatch({
            type: ActionTypes.TOGGLE_IMG_SHOW
        });
    }
}

export function queryNav(projectId = null, moduleId = null, materialId = null, callback = null) {
    return dispatch => dispatch({
        type: [],
        req: {
            method: 'query',
            url: '/nav.json',
            param: {
                projectId: projectId,
                moduleId: moduleId,
                materialId: materialId
            }
        },
        onSuccess: callback
    });
}

export function updateNav(navList) {
    return dispatch => dispatch({
        type: ActionTypes.UPDATE_NAV,
        payload: navList
    });
}
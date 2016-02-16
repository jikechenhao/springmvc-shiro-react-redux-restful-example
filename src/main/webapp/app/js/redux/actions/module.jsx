import ActionTypes from 'js/constants/constants';
import Base64 from 'js/util/Base64';
import { history } from 'js/routes/routeUtil';

export function queryModule(projectId) {
    return dispatch => dispatch({
        type: [ActionTypes.RESET_MODULE, [ActionTypes.RESET_FILTER, ActionTypes.QUERY_MODULE]],
        req: {
            method: 'query',
            url: '/module/' + projectId + '/module.json',
        }
    });

}

export function queryMaterialForPreview(module) {
    return dispatch => dispatch({
        type: [],
        req: {
            method: 'query',
            url: '/material/' + module.moduleId + '/preview.json'
        },
        onSuccess: payload => {
            dispatch({
                type: ActionTypes.QUERY_MATERIAL_FOR_PREVIEW,
                payload: {
                    oldModule: module,
                    materialList: payload.entity
                }
            });
        }
    });
}

export function queryModuleWithConfirmedPurchase(projectId) {
    return dispatch => dispatch({
        type: [ActionTypes.RESET_MODULE, [ActionTypes.RESET_FILTER, ActionTypes.QUERY_MODULE]],
        req: {
            method: 'query',
            url: '/order/' + projectId + '/storage.json'
        }
    });
}

export function deleteModule(deletePwd, module) {
    return dispatch => dispatch({
        type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.DELETE_MODULE]],
        req: {
            method: 'del',
            url: '/module/module.json',
            param: {
                moduleId: module.moduleId,
                token: (new Base64).encode("_delete_:" + deletePwd)
            }
        },
        payload: module
    });
}

export function updateModule(form, module) {
    return dispatch => {
        const moduleName = form.moduleName.value.trim();
        if (!moduleName) {
            return;
        }

        dispatch({
            type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.UPDATE_MODULE]],
            req: {
                method: 'update',
                url: '/module/module.json',
                param: {moduleId: module.moduleId, moduleName: moduleName}
            },
            payload: {
                module: module,
                newModuleName: moduleName
            }
        });
    }
}

export function createModule(form, projectId) {
    return dispatch => {
        const moduleName = form.moduleName.value.trim();
        if (!moduleName) {
            return;
        }

        dispatch({
            type: [, ActionTypes.CREATE_MODULE],
            req: {
                method: 'create',
                url: '/module/' + projectId + '/module.json',
                param: {moduleName: moduleName, projectId: projectId}
            },
            onSuccess: () => {
                form.moduleName.focus();
                form.reset();
            }
        });
    }
}

export function uploadExcel(form, file, projectId) {
    return dispatch => dispatch({
        type: [, ActionTypes.CLOSE_MODAL, ActionTypes.CLOSE_MODAL],
        req: {
            method: 'upload',
            url: '/module/uploadExcel.json?projectId=' + projectId,
            param: file
        },
        onSuccess: () => {
            form.reset();
            history.get().push('/admin/' + projectId + '/preview');
        }
    });
}

export function downloadStorageExcel(projectId, materialName, spName, supplier) {
    return dispatch => dispatch({
        type: [],
        req: {
            method: 'download',
            url: ''
        },
        onSuccess: payload => {
            window.open(
                '/order/storage/excel.json?' +
                'projectId=' + projectId +
                (materialName ? '&materialName=' + encodeURI(materialName) : '') +
                (spName ? '&spName=' + encodeURI(spName) : '') +
                (supplier ? '&supplier=' + encodeURI(supplier) : '') +
                '&t=' + payload.entity);
        }
    });
}

export function downloadBossExcel(projectId, materialName, spName, supplier) {
    return dispatch => dispatch({
        type: [],
        req: {
            method: 'download',
            url: ''
        },
        onSuccess: payload => {
            window.open(
                '/order/boss/excel.json?' +
                'projectId=' + projectId +
                '&t=' + payload.entity);
        }
    });
}
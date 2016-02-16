import ActionTypes from 'js/constants/constants';

export function queryMaterial(moduleId) {
    return dispatch => dispatch({
        type: [ActionTypes.RESET_MATERIAL, [ActionTypes.RESET_FILTER, ActionTypes.QUERY_MATERIAL]],
        req: {
            method: 'query',
            url: '/material/' + moduleId + '/material.json'
        }
    });
}

export function querySpForApply(material) {
    return dispatch => dispatch({
        type: [],
        req: {
            method: 'query',
            url: '/sp/' + material.materialId + '/sp.json',
        },
        onSuccess: payload => {
            dispatch({
                type: ActionTypes.QUERY_SP_FOR_APPLY,
                payload: {
                    oldMaterial: material,
                    spList: payload.entity
                }
            });
        }
    });
}

export function deleteMaterial(material) {
    return dispatch => dispatch({
        type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.DELETE_MATERIAL]],
        req: {
            method: 'del',
            url: '/material/material.json',
            param: {materialId: material.materialId}
        },
        payload: material
    });
}

export function updateMaterial(form, material) {
    return dispatch => {
        const materialName = form.materialName.value.trim();
        if (!materialName) {
            return;
        }

        dispatch({
            type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.UPDATE_MATERIAL]],
            req: {
                method: 'update',
                url: '/material/material.json',
                param: {materialId: material.materialId, materialName: materialName}
            },
            payload: {
                material: material,
                newMaterialName: materialName
            }
        });
    }
}

export function createMaterial(form, moduleId) {
    return dispatch => {
        const materialName = form.materialName.value.trim();
        if (!materialName) {
            return;
        }

        dispatch({
            type: [, ActionTypes.CREATE_MATERIAL],
            req: {
                method: 'create',
                url: '/material/' + moduleId + '/material.json',
                param: {materialName: materialName, moduleId: moduleId}
            },
            onSuccess: () => {
                form.materialName.focus();
                form.reset();
            }
        });
    }
}
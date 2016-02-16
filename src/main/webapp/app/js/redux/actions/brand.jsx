import ActionTypes from 'js/constants/constants';

export function queryBrand(projectId) {
    return dispatch => dispatch({
        type: [ActionTypes.RESET_BRAND, [ActionTypes.RESET_FILTER, ActionTypes.QUERY_BRAND]],
        req: {
            method: 'query',
            url: '/brand/' + projectId + '/brand.json',
        }
    });
}

export function deleteBrand(brand) {
    return dispatch => dispatch({
        type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.DELETE_BRAND]],
        req: {
            method: 'del',
            url: '/brand/brand.json',
            param: {brandId: brand.brandId}
        },
        payload: brand
    });
}

export function updateBrand(form, brand) {
    return dispatch => {
        const brandName = form.brandName.value.trim();
        if (!brandName) {
            return;
        }

        dispatch({
            type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.UPDATE_BRAND]],
            req: {
                method: 'update',
                url: '/brand/brand.json',
                param: {brandId: brand.brandId, brandName: brandName}
            },
            payload: {
                brand: brand,
                newBrandName: brandName
            }
        });
    }
}

export function createBrand(form, projectId) {
    return dispatch => {
        const brandName = form.brandName.value.trim();
        if (!brandName) {
            return;
        }

        dispatch({
            type: [, ActionTypes.CREATE_BRAND],
            req: {
                method: 'create',
                url: '/brand/' + projectId + '/brand.json',
                param: {
                    brandName: brandName,
                    projectId: projectId
                }
            },
            onSuccess: () => {
                form.brandName.focus();
                form.reset();
            }
        });
    }
}

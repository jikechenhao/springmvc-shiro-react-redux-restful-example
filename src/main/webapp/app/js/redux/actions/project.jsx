import ActionTypes from 'js/constants/constants';
import Base64 from 'js/util/Base64';

export function queryProject() {
    return dispatch => dispatch({
        type: [ActionTypes.RESET_PROJECT, [ActionTypes.RESET_FILTER, ActionTypes.QUERY_PROJECT]],
        req: {
            method: 'query',
            url: '/project/project.json'
        }
    });
}

export function deleteProject(deletePwd, project) {
    return dispatch => dispatch({
        type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.DELETE_PROJECT]],
        req: {
            method: 'del',
            url: '/project/project.json',
            param: {projectId: project.projectId, token: (new Base64).encode("_delete_:" + deletePwd)}
        },
        payload: project
    });
}

export function updateProject(form, project) {
    return dispatch => {
        var projectName = form.projectName.value.trim();
        var contractNO = form.contractNO.value.trim();
        if (!projectName || !contractNO) {
            return;
        }

        dispatch({
            type: [, [ActionTypes.CLOSE_MODAL, ActionTypes.UPDATE_PROJECT]],
            req: {
                method: 'update',
                url: '/project/project.json',
                param: {projectId: project.projectId, projectName: projectName, contractNO: contractNO}
            },
            payload: {
                project: project,
                newProjectName: projectName,
                newContractNO: contractNO
            }
        });
    }
}

export function createProject(form) {
    return dispatch => {
        const projectName = form.projectName.value.trim();
        const contractNO = form.contractNO.value.trim();
        if (!projectName || !contractNO) {
            return;
        }
        dispatch({
            type: [, ActionTypes.CREATE_PROJECT],
            req: {
                method: 'create',
                url: '/project/project.json',
                param: {projectName: projectName, contractNO: contractNO}
            },
            onSuccess: () => {
                form.projectName.focus();
                form.reset();
            }
        });
    }
}


import ActionTypes from 'js/constants/constants';

const initialState = [];

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.QUERY_PROJECT:
            return [...payload.entity];
        case ActionTypes.DELETE_PROJECT:
        {
            const newState = [...state];
            const index = state.indexOf(payload);
            if (-1 < index) {
                newState.splice(index, 1);
            }
            return newState;
        }
        case ActionTypes.UPDATE_PROJECT:
        {
            const newState = [...state];
            const { project, newProjectName, newContractNO} = payload;
            const index = state.indexOf(project);
            if (-1 < index) {
                newState.splice(index, 1, {...project, projectName: newProjectName, contractNO: newContractNO});
            }
            return newState;
        }
        case ActionTypes.CREATE_PROJECT:
        {
            const newState = [...state];
            newState.unshift(payload.entity);
            return newState;
        }
        case ActionTypes.RESET_PROJECT:
            return [];
        default:
            return state;
    }
}
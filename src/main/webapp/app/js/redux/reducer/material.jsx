import ActionTypes from 'js/constants/constants';

const initialState = [];

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.QUERY_MATERIAL:
            return [...payload.entity];
        case ActionTypes.QUERY_SP_FOR_APPLY:
        {
            const newState = [...state];
            const { oldMaterial, spList } = payload;
            newState.splice(state.indexOf(oldMaterial), 1, {...oldMaterial, spList: spList});
            return newState;
        }
        case ActionTypes.DELETE_MATERIAL:
        {
            const newState = [...state];
            if (state.includes(payload)) {
                newState.splice(state.indexOf(payload), 1);
            }
            return newState;
        }
        case ActionTypes.UPDATE_MATERIAL:
        {
            const newState = [...state];
            const { material, newMaterialName } = payload;
            const index = state.indexOf(material);
            if (-1 < index) {
                newState.splice(index, 1, {...material, materialName: newMaterialName});
            }
            return newState;
        }
        case ActionTypes.CREATE_MATERIAL:
        {
            const newState = [...state];
            newState.unshift(payload.entity);
            return newState;
        }
        case ActionTypes.RESET_MATERIAL:
            return [];
        default:
            return state;
    }
}
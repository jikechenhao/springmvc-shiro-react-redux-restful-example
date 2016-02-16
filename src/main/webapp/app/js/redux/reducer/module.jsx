import ActionTypes from 'js/constants/constants';

const initialState = [];

export default function reducer(state = initialState, action = {}) {
    const { type, payload } = action;
    switch (type) {
        case ActionTypes.QUERY_MODULE:
            return [...payload.entity];
        case ActionTypes.QUERY_MATERIAL_FOR_PREVIEW:
        {
            const newState = [...state];
            const { oldModule, materialList } = payload;
            newState.splice(state.indexOf(oldModule), 1, {...oldModule, materialList: materialList});
            return newState;
        }
        case ActionTypes.QUERY_APPLY_RECORD:
        {
            const newState = [...state];
            const { oldModule, applyRecordList } = payload;
            newState.splice(state.indexOf(oldModule), 1, {...oldModule, applyRecordList: applyRecordList});
            return newState;
        }
        case ActionTypes.DELETE_APPLY_RECORD:
        {
            //改变applyRecord的保存位置...
            const newState = [...state];
            const { oldModule, applyRecord } = payload;
            const indexOfModule = state.indexOf(oldModule);
            console.log('indexOfModule: ', indexOfModule);
            const indexOfApplyRecord = state[indexOfModule].applyRecordList.indexOf(applyRecord);
            console.log('indexOfApplyRecord: ', indexOfApplyRecord);
            if (-1 < indexOfApplyRecord) {
                oldModule.applyRecordList.splice(indexOfApplyRecord, 1);
                newState.splice(indexOfModule, 1, {...oldModule});
            }
            return newState;
        }
        case ActionTypes.DELETE_MODULE:
        {
            const newState = [...state];
            if (state.includes(payload)) {
                newState.splice(state.indexOf(payload), 1);
            }
            return newState;
        }
        case ActionTypes.UPDATE_MODULE:
        {
            const newState = [...state];
            const { module, newModuleName } = payload;
            const index = state.indexOf(module);
            if (-1 < index) {
                newState.splice(index, 1, {...module, moduleName: newModuleName});
            }
            return newState;
        }
        case ActionTypes.CREATE_MODULE:
        {
            const newState = [...state];
            newState.unshift(payload.entity);
            return newState;
        }
        case ActionTypes.RESET_MODULE:
            return [];
        default:
            return state;
    }
}
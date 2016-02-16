import { combineReducers } from 'redux';
import user from './user';
import projectList from './project';
import moduleList from './module';
import materialList from './material';
import spList from './sp';
import brandList from './brand';
import applyList from './apply';
import arrivedList from './arrived';
import purchase from './purchase';
import filter from './filter';
import container from './container';

export default combineReducers({
    projectList,
    moduleList,
    materialList,
    spList,
    brandList,
    applyList,
    arrivedList,
    user,
    purchase,
    filter,
    container
})
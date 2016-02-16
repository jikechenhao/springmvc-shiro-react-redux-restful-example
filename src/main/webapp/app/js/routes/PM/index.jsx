import { validateRole } from '../routeUtil';
import ProjectTable from 'js/components/ProjectTable';
import ModuleCollapse from './components/ModuleCollapse';
import Apply from './components/Apply';

const PMRoute = {
    path: 'pm',
    component: 'div',
    indexRoute: {
        component: ProjectTable
    },
    childRoutes: [
        {
            path: 'project',
            component: ProjectTable
        },
        {
            path: ':projectId/module',
            component: ModuleCollapse
        },
        {
            path: ':projectId/:moduleId/apply',
            component: Apply
        }
    ],
    onEnter(nextState, replace) {
        validateRole(nextState, replace, 'pm');
    }
};

module.exports = PMRoute;
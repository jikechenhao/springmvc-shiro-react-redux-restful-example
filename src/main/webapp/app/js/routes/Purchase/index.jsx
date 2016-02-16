import { validateRole } from '../routeUtil';
import ProjectTable from 'js/components/ProjectTable';
import ModuleCollapse from './components/ModuleCollapse';

const PurchaseRoute = {
    path: 'purchase',
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
        }
    ],
    onEnter(nextState, replace) {
        validateRole(nextState, replace, 'purchase');
    }
};

module.exports = PurchaseRoute;
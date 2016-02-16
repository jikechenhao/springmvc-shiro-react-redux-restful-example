import { validateRole } from '../routeUtil';
import ProjectTable from 'js/components/ProjectTable';
import ConfirmedPurchaseCollapse from './components/ConfirmedPurchaseCollapse';

const StorageRoute = {
    path: 'storage',
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
            component: ConfirmedPurchaseCollapse
        }
    ],
    onEnter(nextState, replace) {
        validateRole(nextState, replace, 'storage');
    }
};

module.exports = StorageRoute;
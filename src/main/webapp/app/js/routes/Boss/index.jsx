import { validateRole } from '../routeUtil';
import ProjectTable from 'js/components/ProjectTable';
import ConfirmedPurchaseCollapse from './components/ConfirmedPurchaseCollapse';

const BossRoute = {
    path: 'boss',
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
        validateRole(nextState, replace, 'boss');
    }
};

module.exports = BossRoute;
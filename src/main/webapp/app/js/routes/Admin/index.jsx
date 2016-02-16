import { validateRole } from '../routeUtil';
import ProjectTable from './components/ProjectTable';
import ModuleTable from './components/ModuleTable';
import MaterialTable from './components/MaterialTable';
import SpTable from './components/SpTable';
import BrandTable from './components/BrandTable';
import Preview from './components/Preview';


const AdminRoute = {
    path: 'admin',
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
            component: ModuleTable
        },
        {
            path: ':moduleId/material',
            component: MaterialTable
        },
        {
            path: ':materialId/sp',
            component: SpTable
        },
        {
            path: ':projectId/brand',
            component: BrandTable
        },
        {
            path: ':projectId/preview',
            component: Preview
        }
    ],
    onEnter(nextState, replace) {
        validateRole(nextState, replace, 'admin');
    }
};

module.exports = AdminRoute;
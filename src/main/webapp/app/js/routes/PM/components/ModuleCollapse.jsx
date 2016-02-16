import React from 'react';
import {Link} from 'react-router';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { queryModule } from 'js/redux/actions/module';
import { queryNav, updateNav } from 'js/redux/actions/container';

import { getHomeUrl } from 'js/routes/routeUtil';

import Collapse from 'js/components/Collapse';

import ApplyRecordTable from './ApplyRecordTable';
//import ApplyStore from 'js/stores/ApplyStore'

class ModuleCollapse extends React.Component {
    constructor(props) {
        super(props);
        this.actions = bindActionCreators({
            queryModule: queryModule,
            queryNav: queryNav,
            updateNav: updateNav,
        }, this.props.dispatch);
    }

    componentDidMount() {
        const { projectId } = this.props.params;
        const { queryModule, queryNav, updateNav } = this.actions;

        queryModule(projectId);
        queryNav(projectId, null, null, payload =>{
            updateNav([
                {path: getHomeUrl() + '/project', title: '项目(' + payload.entity.projectName + ')'},
                {path: this.props.location.pathname, title: '申请记录'}
            ]);
        });

        //ApplyStore.setProjectId(this.props.params.projectId);
    }

    render() {
        const moduleCollapseList = [];
        const { moduleList } = this.props;
        if (moduleList) {
            moduleList.forEach((item, index) => {
                moduleCollapseList.push(
                    <Collapse
                        header = {
                            <div style = {{lineHeight: '30px'}}>
                                {item.moduleName}
                                <Link
                                    to = {`${getHomeUrl()}/${this.props.params.projectId}/${item.moduleId}/apply`}
                                    className = 'btn btn-info btn-sm pull-right'
                                    >
                                    申请材料
                                </Link>
                            </div>
                        }
                        key = {item.moduleId}
                        >
                        <ApplyRecordTable module = {item} key = {item.moduleId + '-' + index}/>
                    </Collapse>
                );
            });
        }

        return (
            <div>
                {moduleCollapseList}
            </div>
        );
    }
}

export default connect(state => ({moduleList: state.moduleList}))(ModuleCollapse);
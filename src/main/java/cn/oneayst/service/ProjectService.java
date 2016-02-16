package cn.oneayst.service;

import cn.oneayst.mapper.ProjectMapper;
import cn.oneayst.model.ProjectModel;
import cn.oneayst.util.MysqlUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProjectService {
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private BrandService brandService;

    public String getProjectNameById(Long projectId) throws Exception {
        return projectMapper.getProjectNameById(projectId);
    }

    public Long getProjectIdByMaterialId(long materialId) throws Exception {
        return projectMapper.getProjectIdByMaterialId(materialId);
    }

    public long getSerialNOA(long projectId) throws Exception {
        return projectMapper.getSerialNOA(projectId);
    }

    public long getSerialNOB(long projectId) throws Exception {
        return projectMapper.getSerialNOB(projectId);
    }

    public List<ProjectModel> queryProject() throws Exception {
        return projectMapper.queryProject();
    }

    @Transactional(rollbackFor = {Exception.class})
    public void deleteProject(long projectId) throws Exception {
        List<Long> moduleIdList = moduleService.getModuleIdListByProjectId(projectId);
        MysqlUtil.exportDataBase();

        for (Long moduleId : moduleIdList) {
            moduleService.deleteModule(moduleId);
        }
        brandService.deleteBrandByProjectId(projectId);
        this.deleteSerialNOByProjectId(projectId);
        projectMapper.deleteProject(projectId);
    }

    private void deleteSerialNOByProjectId(long projectId) throws Exception {
        projectMapper.deleteSerialNOByProjectId(projectId);
    }

    public void updateProject(ProjectModel project) throws Exception {
        projectMapper.updateProject(project);
    }

    public void increaseSerialNOA(long projectId) throws Exception {
        projectMapper.increaseSerialNOA(projectId);
    }

    public void increaseSerialNOB(long projectId) throws Exception {
        projectMapper.increaseSerialNOB(projectId);
    }

    public void createProject(ProjectModel project) throws Exception {
        projectMapper.createProject(project);
        this.createSerialNO(project.getProjectId());
    }

    public void createSerialNO(long projectId) throws Exception {
        projectMapper.createSerialNO(projectId);
    }
}

package cn.oneayst.mapper;

import cn.oneayst.model.ProjectModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectMapper {

    Long getProjectIdByMaterialId(@Param("materialId") long materialId) throws Exception;

    String getProjectNameById(@Param("projectId") long projectId) throws Exception;

    List<ProjectModel> queryProject() throws Exception;

    void deleteProject(@Param("projectId") Long projectId) throws Exception;

    void deleteSerialNOByProjectId(@Param("projectId") long projectId) throws Exception;

    void updateProject(ProjectModel project) throws Exception;

    void increaseSerialNOA(@Param("projectId") long projectId) throws Exception;

    void increaseSerialNOB(@Param("projectId") long projectId) throws Exception;

    void createProject(ProjectModel project) throws Exception;

    void createSerialNO(@Param("projectId") long projectId) throws Exception;

    long getSerialNOA(@Param("projectId") long projectId) throws Exception;

    long getSerialNOB(@Param("projectId") long projectId) throws Exception;
}

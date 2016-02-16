package cn.oneayst.mapper;

import cn.oneayst.model.ModuleModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ModuleMapper {
    String getModuleNameById(@Param("moduleId") long moduleId) throws Exception;

    List<Long> getModuleIdListByProjectId(@Param("projectId") long projectId) throws Exception;

    List<ModuleModel> queryModule(@Param("projectId") long projectId) throws Exception;

    void createModule(ModuleModel moduleModel) throws Exception;

    void updateModule(ModuleModel module) throws Exception;

    void deleteModule(@Param("moduleId") long moduleId) throws Exception;
}

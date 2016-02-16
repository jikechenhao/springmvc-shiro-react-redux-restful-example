package cn.oneayst.service;

import cn.oneayst.mapper.ModuleMapper;
import cn.oneayst.model.ModuleModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ModuleService {
    @Autowired
    private ModuleMapper moduleMapper;
    @Autowired
    private OrderService orderService;
    @Autowired
    private SpService spService;
    @Autowired
    private MaterialService materialService;

    public String getModuleNameById(long moduleId) throws Exception {
        return moduleMapper.getModuleNameById(moduleId);
    }

    public List<Long> getModuleIdListByProjectId(long projectId) throws Exception {
        return moduleMapper.getModuleIdListByProjectId(projectId);
    }

    public List<ModuleModel> queryModule(long projectId) throws Exception {
        return moduleMapper.queryModule(projectId);
    }

    public void updateModule(ModuleModel module) throws Exception {
        moduleMapper.updateModule(module);
    }

    @Transactional(rollbackFor = {Exception.class})
    public void deleteModule(long moduleId) throws Exception {
        orderService.deleteOrderByModuleId(moduleId);
        orderService.deleteOrderApplyByModuleId(moduleId);
        spService.deleteSpByModuleId(moduleId);
        materialService.deleteMaterialByModuleId(moduleId);
        moduleMapper.deleteModule(moduleId);
    }

    public void createModule(ModuleModel module) throws Exception {
        moduleMapper.createModule(module);
    }
}

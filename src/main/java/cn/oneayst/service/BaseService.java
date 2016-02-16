package cn.oneayst.service;

import cn.oneayst.mapper.BaseMapper;
import cn.oneayst.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class BaseService {
    @Autowired
    private BaseMapper baseMapper;
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private MaterialService materialService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private SpService spService;

    public RouteModel getRoute(Long projectId, Long moduleId, Long materialId) throws Exception {
        return baseMapper.getRoute(projectId, moduleId, materialId);
    }

    @Transactional(rollbackFor = {Exception.class})
    public void addByBatch(Map<ModuleModel, Map<MaterialModel, List<SpModel>>> moduleMap, Map<String, BrandModel> brandMap) throws Exception {
        for (Map.Entry<String, BrandModel> brandEntry : brandMap.entrySet()) {
            brandService.createBrand(brandEntry.getValue());
        }

        ModuleModel module = null;
        MaterialModel material = null;
        Map<MaterialModel, List<SpModel>> materialMap = null;
        Set<Map.Entry<ModuleModel, Map<MaterialModel, List<SpModel>>>> entrySet = moduleMap.entrySet();
        long moduleId = 0;
        for (HashMap.Entry<ModuleModel, Map<MaterialModel, List<SpModel>>> entry : entrySet) {
            module = entry.getKey();

            moduleService.createModule(module);
            materialMap = entry.getValue();
            moduleId = module.getModuleId();
            if (0 != materialMap.size()) {
                Set<Map.Entry<MaterialModel, List<SpModel>>> materialEntrySet = materialMap.entrySet();
                for (Map.Entry<MaterialModel, List<SpModel>> materialEntry : materialEntrySet) {
                    material = materialEntry.getKey();
                    material.setModuleId(moduleId);
                    materialService.createMaterial(material);
                    List<SpModel> spEntryList = materialEntry.getValue();
                    spService.batchCreateSp(material.getMaterialId(), spEntryList);
                }
            }
        }
    }
}

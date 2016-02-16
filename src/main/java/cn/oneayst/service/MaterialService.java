package cn.oneayst.service;

import cn.oneayst.mapper.MaterialMapper;
import cn.oneayst.model.MaterialModel;
import cn.oneayst.model.MaterialSpModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialService {
    @Autowired
    private MaterialMapper materialMapper;

    public String getMaterialNameById(long materialId) throws Exception {
        return materialMapper.getMaterialNameById(materialId);
    }

    public List<MaterialModel> queryMaterial(long moduleId) throws Exception {
        return materialMapper.queryMaterial(moduleId);
    }

    public List<MaterialSpModel> queryMaterialForPreview(long moduleId) throws Exception {
        return materialMapper.queryMaterialForPreview(moduleId);
    }

    public void deleteMaterial(MaterialModel material) throws Exception {
        materialMapper.deleteMaterial(material.getMaterialId());
    }

    public void deleteMaterialByModuleId(long moduleId) throws Exception {
        materialMapper.deleteMaterialByModuleId(moduleId);
    }

    public void updateMaterial(MaterialModel material) throws Exception {
        materialMapper.updateMaterial(material);
    }

    public void createMaterial(MaterialModel material) throws Exception {
        materialMapper.createMaterial(material);
    }
}

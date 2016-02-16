package cn.oneayst.service;

import cn.oneayst.mapper.SpMapper;
import cn.oneayst.model.SpModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpService {
    @Autowired
    private SpMapper spMapper;
    @Autowired
    private BrandService brandService;

    public String getSpNameById(long spId) throws Exception {
        return spMapper.getSpNameById(spId);
    }

    public List<SpModel> querySp(long materialId) throws Exception {
        return spMapper.querySp(materialId);
    }

    public void deleteSp(SpModel sp) throws Exception {
        spMapper.deleteSp(sp.getSpId());
    }

    public void deleteSpByModuleId(long moduleId) throws Exception {
        spMapper.deleteSpByModuleId(moduleId);
    }

    public void updateSp(SpModel sp) throws Exception {
        spMapper.updateSp(sp);
    }

    public void createSp(SpModel sp) throws Exception {
        sp.setBrand(brandService.getOrCreateBrand(sp.getBrandName(), null, sp.getMaterialId()));
        spMapper.createSp(sp);
    }

    public void batchCreateSp(long materialId, List<SpModel> spList) throws Exception {
        spMapper.batchCreateSp(materialId, spList);
    }
}

package cn.oneayst.service;

import cn.oneayst.mapper.BrandMapper;
import cn.oneayst.model.BrandModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BrandService {
    @Autowired
    private BrandMapper brandMapper;
    @Autowired
    private ProjectService projectService;

    public BrandModel getBrandByName(String brandName, Long projectId, Long materialId) throws Exception {
        if (null != materialId) {
            projectId = projectService.getProjectIdByMaterialId(materialId);
        }

        return brandMapper.getBrandByName(brandName, projectId);
    }

    public List<BrandModel> queryBrand(long projectId) throws Exception {
        return brandMapper.queryBrand(projectId);
    }

    public BrandModel getOrCreateBrand(String brandName, Long projectId, Long materialId) throws Exception {
        if (null != materialId) {
            projectId = projectService.getProjectIdByMaterialId(materialId);
        }
        if (null == projectId) {
            throw new NullPointerException("projectId为空时无法查询品牌信息");
        }
        BrandModel brand = this.getBrandByName(brandName, projectId, null);
        if (null == brand) {
            brand = new BrandModel();
            brand.setBrandName(brandName);
            brand.setProjectId(projectId);
            this.createBrand(brand);
        }

        return brand;
    }

    public void deleteBrandByProjectId(long projectId) throws Exception {
        brandMapper.deleteBrandByProjectId(projectId);
    }

    public void createBrand(BrandModel brand) throws Exception {
        brandMapper.createBrand(brand);
    }

    public String getBrandNameById(long brandId) throws Exception {
        return brandMapper.getBrandNameById(brandId);
    }

    public void deleteBrand(long brandId) throws Exception {
        brandMapper.deleteBrand(brandId);
    }

    public void updateBrand(BrandModel brand) throws Exception {
        brandMapper.updateBrand(brand);
    }
}

package cn.oneayst.controller;

import cn.oneayst.model.BrandModel;
import cn.oneayst.service.BrandService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("brand")
public class BrandController extends BaseController {
    @Autowired
    private BrandService brandService;

    @RequestMapping(value = "{projectId}/brand", method = RequestMethod.GET)
    public Map queryBrand(@PathVariable long projectId) throws Exception {
        return resultMap(true, null, brandService.queryBrand(projectId));
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "brand", method = RequestMethod.DELETE)
    public Map deleteBrand(@RequestBody BrandModel brand) throws Exception {
        try {
            String brandName = brandService.getBrandNameById(brand.getBrandId());
            brandService.deleteBrand(brand.getBrandId());
            return resultMap(true, "删除品牌成功: " + brandName);
        } catch (DataIntegrityViolationException e) {
            return resultMap(false, "删除品牌失败, 有记录正在使用该品牌");
        }
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "brand", method = RequestMethod.PUT)
    public Map updateBrand(@RequestBody BrandModel brand) throws Exception {
        brandService.updateBrand(brand);
        return resultMap(true, "修改品牌成功: " + brand.getBrandName());
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "{projectId}/brand", method = RequestMethod.POST)
    public Map createBrand(@RequestBody BrandModel brand) throws Exception {
        brandService.createBrand(brand);
        return resultMap(true, "创建品牌成功: " + brand.getBrandName(), brand);
    }
}

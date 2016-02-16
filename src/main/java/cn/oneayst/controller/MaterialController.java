package cn.oneayst.controller;

import cn.oneayst.model.MaterialModel;
import cn.oneayst.service.MaterialService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("material")
public class MaterialController extends BaseController {
    @Autowired
    private MaterialService materialService;

    @RequestMapping(value = "{moduleId}/material", method = RequestMethod.GET)
    public Map queryMaterial(@PathVariable long moduleId) throws Exception {
        return resultMap(true, materialService.queryMaterial(moduleId));
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "{moduleId}/preview", method = RequestMethod.GET)
    public Map preview(@PathVariable long moduleId) throws Exception {
        return resultMap(true, materialService.queryMaterialForPreview(moduleId));
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "material", method = RequestMethod.DELETE)
    public Map deleteMaterial(@RequestBody MaterialModel material) throws Exception {
        try {
            String materialName = materialService.getMaterialNameById(material.getMaterialId());
            materialService.deleteMaterial(material);
            return resultMap(true, "删除材料成功: " + materialName);
        } catch (DataIntegrityViolationException e) {
            return resultMap(false, "删材料除失败, 有记录正在使用该材料或者该材料有规格型号未删除");
        }
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "material", method = RequestMethod.PUT)
    public Map updateMaterial(@RequestBody MaterialModel material) throws Exception {
        materialService.updateMaterial(material);
        return resultMap(true, "修改材料成功: " + material.getMaterialName());
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "{moduleId}/material", method = RequestMethod.POST)
    public Map createMaterial(@RequestBody MaterialModel material) throws Exception {
        materialService.createMaterial(material);
        return resultMap(true, "创建材料成功: " + material.getMaterialName(), material);
    }
}

package cn.oneayst.controller;

import cn.oneayst.model.SpModel;
import cn.oneayst.service.SpService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("sp")
public class SpController extends BaseController {
    @Autowired
    private SpService spService;

    @RequestMapping(value = "{materialId}/sp", method = RequestMethod.GET)
    public Map querySP(@PathVariable long materialId) throws Exception {
        return resultMap(true, spService.querySp(materialId));
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "sp", method = RequestMethod.DELETE)
    public Map deleteSp(@RequestBody SpModel sp) throws Exception {
        try {
            String spName = spService.getSpNameById(sp.getSpId());
            spService.deleteSp(sp);
            return resultMap(true, "删除规格型号成功: " + spName);
        } catch (DataIntegrityViolationException e) {
            return resultMap(false, "删除规格型号失败, 有记录正在使用该规格型号");
        }
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "sp", method = RequestMethod.PUT)
    public Map updateMaterial(@RequestBody SpModel sp) throws Exception {
        spService.updateSp(sp);
        return resultMap(true, "修改规格型号成功: " + sp.getSpName());
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "{materialId}/sp", method = RequestMethod.POST)
    public Map createMaterial(@RequestBody SpModel sp) throws Exception {
        spService.createSp(sp);
        return resultMap(true, "创建规格型号成功: " + sp.getSpName(), sp);
    }
}

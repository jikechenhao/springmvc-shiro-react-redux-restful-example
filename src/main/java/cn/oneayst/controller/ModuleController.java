package cn.oneayst.controller;

import cn.oneayst.model.ModuleModel;
import cn.oneayst.service.BaseService;
import cn.oneayst.service.ModuleService;
import cn.oneayst.service.UserService;
import cn.oneayst.util.ExcelUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@RestController
@RequestMapping("module")
public class ModuleController extends BaseController {
    @Autowired
    private ModuleService moduleService;
    @Autowired
    private BaseService baseService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "{projectId}/module", method = RequestMethod.GET)
    public Map queryModule(@PathVariable long projectId) throws Exception {
        return resultMap(true, moduleService.queryModule(projectId));
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "module", method = RequestMethod.DELETE)
    public Map deleteModule(@RequestBody JSONObject infoObject) throws Exception {
        try {
            if (!userService.checkOldPwd(infoObject.getString("token"))) {
                return resultMap(false, "删除密码错误");
            }
            long moduleId = infoObject.getLongValue("moduleId");
            String moduleName = moduleService.getModuleNameById(moduleId);
            moduleService.deleteModule(moduleId);
            return resultMap(true, "删除模块成功: " + moduleName);
        } catch (DataIntegrityViolationException e) {
            return resultMap(false, "删除模块失败, 有记录正在使用该模块或者该模块有规格型号未删除");
        }
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "module", method = RequestMethod.PUT)
    public Map updateModule(@RequestBody ModuleModel module) throws Exception {
        moduleService.updateModule(module);
        return resultMap(true, "修改模块成功: " + module.getModuleName());
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "{projectId}/module", method = RequestMethod.POST)
    public Map createModule(@RequestBody ModuleModel module) throws Exception {
        moduleService.createModule(module);
        return resultMap(true, "创建模块成功: " + module.getModuleName(), module);
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "uploadExcel", method = RequestMethod.POST)
    public Map upload(final ShiroHttpServletRequest request, final HttpServletResponse response, @RequestParam("file") CommonsMultipartFile file) throws Exception {
        Long projectId = null;
        if (null == (projectId = Long.parseLong(request.getParameter("projectId")))) {
            return resultMap(false, "请先选择一个项目再上传");
        }
        System.out.println("准备...");
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getServletContext());
        System.out.println("准备检查文件");
        if (commonsMultipartResolver.isMultipart(request)) {
            if (null != file) {
                try {
                    System.gc();
                    System.out.println("解析前占用应用内存:" + (Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory()));

                    ExcelUtil.readExcel(file, baseService, projectId);

                    System.gc();
                    System.out.println("解析完成并保存后占用应用内存:" + (Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory()));
                } catch (NumberFormatException e) {
                    return resultMap(false, "数字列解析失败, 请检查所有数字列是否含非数字内容");
                } catch (Exception e) {
                    return resultMap(false, "excel解析失败, 请检查excel格式是否和约定的一致");
                }
            } else {
                System.out.println("文件为空");
            }
        }

        return resultMap(true, "解析excel成功");
    }
}

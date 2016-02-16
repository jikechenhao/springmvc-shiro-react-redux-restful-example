package cn.oneayst.controller;

import cn.oneayst.model.ProjectModel;
import cn.oneayst.service.BrandService;
import cn.oneayst.service.ProjectService;
import cn.oneayst.service.UserService;
import com.alibaba.fastjson.JSONObject;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
import java.util.Map;

@RestController
@RequestMapping("project")
public class ProjectController extends BaseController {
    @Autowired
    private ProjectService projectService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "project", method = RequestMethod.GET)
    public Map queryProject() throws Exception {
        return resultMap(true, projectService.queryProject());
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "project", method = RequestMethod.DELETE)
    public Map deleteProject(@RequestBody JSONObject infoObject) throws Exception {
        try {
            if (!userService.checkOldPwd(infoObject.getString("token"))) {
                return resultMap(false, "删除密码错误");
            }
            long projectId = infoObject.getLongValue("projectId");
            String projectName = projectService.getProjectNameById(projectId);
            projectService.deleteProject(projectId);
            return resultMap(true, "删除项目成功: " + projectName);
        } catch (DataIntegrityViolationException e) {
            return resultMap(false, "删材项目失败, 有记录正在使用该项目或者该项目有模块未删除");
        } catch (UnknownAccountException e) {
            return resultMap(false, "请先设置删除密码");
        }
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "project", method = RequestMethod.PUT)
    public Map updateProject(@RequestBody ProjectModel project) throws Exception {
        projectService.updateProject(project);
        return resultMap(true, "修改项目成功: " + project.getProjectName());
    }


    @RequiresRoles("admin")
    @RequestMapping(value = "project", method = RequestMethod.POST)
    public Map createProject(@RequestBody ProjectModel project) throws Exception {
        project.setCreateDate(new Date(System.currentTimeMillis()));
        projectService.createProject(project);
        return resultMap(true, "创建项目成功: " + project.getProjectName(), project);
    }
}

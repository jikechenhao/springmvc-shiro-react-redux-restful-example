package cn.oneayst.controller;

import cn.oneayst.model.UserModel;
import cn.oneayst.service.BaseService;
import cn.oneayst.service.UserService;
import cn.oneayst.shiro.token.TokenUtil;
import cn.oneayst.util.EncryptUtil;
import com.alibaba.fastjson.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Base64;
import java.util.Map;

@RestController
public class UserController extends BaseController {
    private static final String deleteAccount = "_delete_";
    @Autowired
    private UserService userService;
    @Autowired
    private TokenUtil tokenUtil;
    @Autowired
    private BaseService baseService;

    @RequestMapping(value = "login", method = RequestMethod.POST)
//    public Map login(HttpServletRequest request, HttpServletResponse response) throws Exception {
    public Map login(@RequestBody Map<String, String> paramMap, HttpServletResponse response) throws Exception {
        String authc = paramMap.get("authc");
        try {
            if (null != authc) {
                String authcInfo = new String(Base64.getDecoder().decode(authc.toString()), "UTF-8");
                String account = authcInfo.split(":")[0];
                String password = authcInfo.split(":")[1];

                AuthenticationToken token = new UsernamePasswordToken(account, password, false);
                Subject subject = SecurityUtils.getSubject();
                subject.login(token);
                response.addHeader("token", tokenUtil.createAndSaveToken(subject));
                UserModel user = userService.getUserInfo(account);
                user.setExistedDeletePwd(null != userService.getUser(deleteAccount));
                user.setRoleList(userService.queryRoleByAccount(account));
                return resultMap(true, null, user);
            } else {
                throw new AuthenticationException();
            }
        } catch (AuthenticationException e) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return resultMap(false, "账号或密码错误");
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.POST)
    public Map logout(@RequestHeader(required = false) String token) throws Exception {
        Subject subject = tokenUtil.getSubject(token);
        if (null != subject) {
            try {
                subject.logout();
            } catch (Exception e) {
            }
        }

        return resultMap(true, "退出登陆成功");
    }

//    开发时方便查看和管理缓存数据
    @RequestMapping(value = "/monitor/remove", method = RequestMethod.POST)
    public void rm(String key, HttpServletResponse response) throws Exception {
        logout(key);
        response.sendRedirect("/monitor.json");
    }

    @RequiresAuthentication
    @RequestMapping(value = "temp", method = RequestMethod.POST)
    public Map generateTempToken(HttpServletRequest request) throws Exception {
        String token = tokenUtil.generateTempToekn(SecurityUtils.getSubject());
        return resultMap(true, (Object) token);
    }

    @RequiresAuthentication
    @RequestMapping(value = "nav", method = RequestMethod.GET)
    public Map queryRoute(Long projectId, Long moduleId, Long materialId) throws Exception {
        return resultMap(true, baseService.getRoute(projectId, moduleId, materialId));
    }

    @RequiresRoles(value = {"admin", "bossboss"}, logical = Logical.OR)
    @RequestMapping(value = "/user/create", method = RequestMethod.POST)
    public Map createUser(@RequestBody JSONObject infoObject) throws Exception {
        String info = new String(Base64.getDecoder().decode(infoObject.getString("info")), "UTF-8");
        UserModel user = new UserModel();
        user.setAccount(info.split(":")[0]);
        user.setPassword(info.split(":")[1]);
        System.out.println("user:" + user);
        EncryptUtil encryptUtil = new EncryptUtil();
        user.setName("______");
        encryptUtil.encryptPassword(user);
        userService.createUser(user);
        return resultMap(true, "设置删除密码成功");
    }

    @RequiresRoles(value = {"admin", "bossboss"}, logical = Logical.OR)
    @RequestMapping(value = "/user/update", method = RequestMethod.PUT)
    public Map updateUser(@RequestBody JSONObject infoObject) throws Exception {
        if (!userService.checkOldPwd(infoObject.getString("oldInfo"))) {
            return resultMap(false, "原来密码错误");
        }
        String newInfo = new String(Base64.getDecoder().decode(infoObject.getString("newInfo")), "UTF-8");
        EncryptUtil encryptUtil = new EncryptUtil();
        UserModel user = new UserModel();
        user.setAccount(newInfo.split(":")[0]);
        user.setPassword(newInfo.split(":")[1]);
        encryptUtil.encryptPassword(user);
        userService.updatePwd(user);
        return resultMap(true, "更新删除密码成功");
    }
}

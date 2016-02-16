package cn.oneayst.shiro.realm;

import cn.oneayst.model.RoleModel;
import cn.oneayst.model.UserModel;
import cn.oneayst.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MyRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) throws AuthorizationException {
        String account = SecurityUtils.getSubject().getPrincipal().toString();
        if (account != null) {
            long userId = Long.parseLong(SecurityUtils.getSubject().getSession().getAttribute("userId").toString());
            List<RoleModel> roleList = null;
            try {
                roleList = userService.queryRole(userId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            // 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            // 用户的角色集合
            // info.addRole("default");
            // 用户的角色集合
            // info.setRoles(user.getRolesName());
            // 用户的角色对应的所有权限，如果只使用角色定义访问权限
            if (null != roleList) {
                for (RoleModel role : roleList) {
                    info.addRole(role.getRole());
                }
                return info;
            } else {
                throw new AuthorizationException("无法查询到对应的权限");
            }
        }
        return null;
    }

    @Override
    public AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String account = (String) token.getPrincipal();

        SimpleAuthenticationInfo authenticationInfo = null;
        UserModel user = null;
        try {
            user = userService.getUser(account);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (null != user) {
            authenticationInfo = new SimpleAuthenticationInfo(user.getAccount(), user.getPassword(), ByteSource.Util.bytes(account + "" + user.getCredentialsSalt()), getName());
            Session session = SecurityUtils.getSubject().getSession();
            session.setAttribute("userAccount", user.getAccount());
            session.setAttribute("username", user.getName());
            session.setAttribute("userId", user.getUserId());
            return authenticationInfo;
        } else {
            throw new UnknownAccountException("未知账号");
        }
    }

    /**
     * 更新用户授权信息缓存.
     */
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    /**
     * 更新用户信息缓存.
     */
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    /**
     * 清除用户授权信息缓存.
     */
    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    /**
     * 清除用户信息缓存.
     */
    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    /**
     * 清空所有缓存
     */
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    /**
     * 清空所有认证缓存
     */
    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }
}

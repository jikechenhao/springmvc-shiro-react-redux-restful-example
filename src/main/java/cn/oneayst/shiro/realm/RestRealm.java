package cn.oneayst.shiro.realm;

import cn.oneayst.model.RoleModel;
import cn.oneayst.model.UserModel;
import cn.oneayst.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import java.util.List;

public class RestRealm extends AuthorizingRealm {
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof AuthenticationToken;
    }

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) throws AuthorizationException {
        String account = (String) principals.getPrimaryPrincipal();
        if (account != null) {
            UserModel user = null;
            List<RoleModel> roleList = null;
            try {
                user = userService.getUser(account);
                roleList = userService.queryRole(user.getUserId());
            } catch (Exception e) {
                e.printStackTrace();
            }
            // 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            // 设置用户的角色集合
            // info.addRole("default");
            // 设置用户的角色集合
            // info.setRoles(user.getRolesName());
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
            return authenticationInfo;
        } else {
            throw new UnknownAccountException("账号或密码错误");
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

package cn.oneayst.service;

import cn.oneayst.mapper.UserMapper;
import cn.oneayst.model.RoleModel;
import cn.oneayst.model.UserModel;
import cn.oneayst.shiro.realm.RestRealm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Base64;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public UserModel getUser(String account) throws Exception {
        return userMapper.getUser(account);
    }

    public UserModel getUserInfo(String account) throws Exception {
        return userMapper.getUserInfo(account);
    }

    public List<RoleModel> queryRole(long userId) throws Exception {
        return userMapper.queryRole(userId);
    }

    public List<RoleModel> queryRoleByAccount(String account) throws Exception {
        return userMapper.queryRoleByAccount(account);
    }

    public List<RoleModel> queryAllRole() throws Exception {
//        return userMapper.queryAllRole();
        return null;
    }

    public boolean checkOldPwd(String tokenStr) throws Exception {
        String userInfo = new String(Base64.getDecoder().decode(tokenStr), "UTF-8");
        UsernamePasswordToken token = new UsernamePasswordToken(userInfo.split(":")[0], userInfo.split(":")[1]);
        System.out.println(token);
        RestRealm realm = (RestRealm) ((RealmSecurityManager) SecurityUtils.getSecurityManager()).getRealms().iterator().next();
        try {
            return null != realm.doGetAuthenticationInfo(token) && realm.getCredentialsMatcher().doCredentialsMatch(token, realm.doGetAuthenticationInfo(token));
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void updatePwd(UserModel user) throws Exception {
        userMapper.updatePwd(user);
    }

    @Transactional(rollbackFor = {Exception.class})
    public void createUser(UserModel user) throws Exception {
        userMapper.createUser(user);
        if (null != user.getRoleList() && 0 < user.getRoleList().size()) {
            userMapper.associatedUserRole(user.getUserId(), user.getRoleList());
        }
    }

    public void createRole(RoleModel role) throws Exception {
        userMapper.createRole(role);
    }
}

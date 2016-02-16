package cn.oneayst.model;

import java.io.Serializable;
import java.util.List;

public class UserModel implements Serializable {
    private long userId;
    private String name;
    private String account;
    private String password;
    private String newPassword;
    private String credentialsSalt;
    private boolean existedDeletePwd;
    private List<RoleModel> roleList;

    public UserModel() {
    }

    public UserModel(String name, String account, String password) {
        this.name = name;
        this.account = account;
        this.password = password;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCredentialsSalt() {
        return credentialsSalt;
    }

    public void setCredentialsSalt(String credentialsSalt) {
        this.credentialsSalt = credentialsSalt;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public boolean isExistedDeletePwd() {
        return existedDeletePwd;
    }

    public void setExistedDeletePwd(boolean existedDeletePwd) {
        this.existedDeletePwd = existedDeletePwd;
    }

    public List<RoleModel> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<RoleModel> roleList) {
        this.roleList = roleList;
    }
}

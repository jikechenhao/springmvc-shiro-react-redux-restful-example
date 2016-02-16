package cn.oneayst.mapper;

import cn.oneayst.model.RoleModel;
import cn.oneayst.model.UserModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    UserModel getUser(@Param("account") String account) throws Exception;

    UserModel getUserInfo(@Param("account") String account) throws Exception;

    List<RoleModel> queryRole(@Param("userId") long userId) throws Exception;

    List<RoleModel> queryRoleByAccount(@Param("account") String account) throws Exception;

    boolean getDeletePwd() throws Exception;

    void updatePwd(UserModel user) throws Exception;

    void createUser(UserModel user) throws Exception;

    void createRole(RoleModel role) throws Exception;

    void associatedUserRole(@Param("userId") long userId, @Param("roleList") List<RoleModel> roleList) throws Exception;
}

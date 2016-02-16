package service;

import cn.oneayst.model.RoleModel;
import cn.oneayst.model.UserModel;
import cn.oneayst.service.UserService;
import cn.oneayst.util.EncryptUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mvc.xml", "classpath:spring-database.xml", "classpath:spring-shiro.xml"})
public class UserServiceTest {
    @Autowired
    private UserService userService;

    @Test
    public void testCreateRole() throws Exception {
        RoleModel role = new RoleModel();
        role.setRole("boss");
        role.setUrl("/boss");
        userService.createRole(role);
    }

    @Test
    public void testCreateUser() throws Exception {
        RoleModel role = new RoleModel();
        role.setRoleId(18);

        EncryptUtil encryptUtil = new EncryptUtil();
        UserModel user = new UserModel();
        user.setAccount("bossboss");
        user.setPassword("bossboss");
        user.setName("老板");
        user.setRoleList(new ArrayList<RoleModel>() {{
            add(role);
        }});
        encryptUtil.encryptPassword(user);
        userService.createUser(user);
        System.out.println(user.getPassword());
    }
}
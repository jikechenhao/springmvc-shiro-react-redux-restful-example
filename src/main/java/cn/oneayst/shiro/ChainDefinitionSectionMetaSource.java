package cn.oneayst.shiro;

import cn.oneayst.model.RoleModel;
import cn.oneayst.service.UserService;
import cn.oneayst.util.StringUtil;
import org.apache.shiro.config.Ini;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.MessageFormat;
import java.util.List;

public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {
    public static final String ROLE_STR = "roles[{0}]";
    @Autowired
    private UserService userService;
    private String filterChainDefinitions;

    public void setFilterChainDefinitions(String filterChainDefinitions) {
        this.filterChainDefinitions = filterChainDefinitions;
    }

    public Ini.Section getObject() throws Exception {
        List<RoleModel> roleList = userService.queryAllRole();
        Ini ini = new Ini();
        ini.load(filterChainDefinitions);
        Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);

        roleList.parallelStream().forEach((role) -> {
            if (!StringUtil.isNullOrEmpty(role.getRole()) && !StringUtil.isNullOrEmpty(role.getUrl())) {
                section.put(role.getUrl(), MessageFormat.format(ROLE_STR, role.getRole()));
//                section.put(role.getUrl(), "roles[" + role.getRole() + "]");
            }
        });

        return section;
    }

    public Class<?> getObjectType() {
        return this.getClass();
    }

    public boolean isSingleton() {
        return false;
    }
}

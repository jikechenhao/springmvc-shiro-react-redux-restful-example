package cn.oneayst.util;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class MysqlUtil {
    static Logger logger = Logger.getLogger(MysqlUtil.class);

    /**
     * 备份数据库
     */
    @Scheduled(fixedRate = 12 * 60 * 60 * 1000)
    public static void exportDataBase() throws Exception {
        System.out.println("备份数据库");
        Runtime.getRuntime().exec("sh /home/jolking/mysql_backup/backup.sh");
    }
}
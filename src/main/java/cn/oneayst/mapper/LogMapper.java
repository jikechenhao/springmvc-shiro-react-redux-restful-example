package cn.oneayst.mapper;

import cn.oneayst.model.ErrLogModel;
import cn.oneayst.model.LoginLogModel;
import cn.oneayst.model.OperLogModel;
import org.springframework.stereotype.Repository;

@Repository
public interface LogMapper {
    void createOperLog(OperLogModel operLogModel) throws Exception;

    void createErrLog(ErrLogModel errLogModel) throws Exception;

    void createLoginLog(LoginLogModel loginLogModel) throws Exception;
}

package cn.oneayst.service;

import cn.oneayst.mapper.LogMapper;
import cn.oneayst.model.ErrLogModel;
import cn.oneayst.model.LoginLogModel;
import cn.oneayst.model.OperLogModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogService {
    @Autowired
    private LogMapper logMapper;

    public void createOperLog(OperLogModel operLogModel) throws Exception {
        logMapper.createOperLog(operLogModel);
    }

    public void createErrLog(ErrLogModel errLogModel) throws Exception {
        logMapper.createErrLog(errLogModel);
    }

    public void createLoginLog(LoginLogModel loginLogModel) throws Exception {
        logMapper.createLoginLog(loginLogModel);
    }
}

package cn.oneayst.aspect;

import cn.oneayst.model.ErrLogModel;
import cn.oneayst.model.LogModel;
import cn.oneayst.model.LoginLogModel;
import cn.oneayst.model.OperLogModel;
import cn.oneayst.service.LogService;
import cn.oneayst.util.StringUtil;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.sql.Timestamp;
import java.util.HashMap;

@Aspect
@Component
public class LogAspect {
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(LogAspect.class);
    @Autowired
    private LogService logService;

    @Pointcut("execution(* cn.oneayst.controller.*.create*(..)) || " +
            "execution(* cn.oneayst.controller.*.update*(..)) || " +
            "execution(* cn.oneayst.controller.*.delete*(..)) || " +
            "execution(* cn.oneayst.controller.*.upload*(..)) || " +
            "execution(* cn.oneayst.controller.*.verity*(..)) || " +
            "execution(* cn.oneayst.controller.*.generate*(..)) || " +
            "execution(* cn.oneayst.controller.*.download*(..)) || " +
            "execution(* cn.oneayst.controller.UserController.update*(..)) ||" +
            "execution(* cn.oneayst.controller.UserController.create*(..))")
    public void businessPointcut() {
    }

    @Pointcut("execution(* cn.oneayst.controller.UserController.login(..))")
    public void loginPointcut() {
    }

    /**
     * 前置通知 用于拦截Controller层记录用户的操作
     */
    @Around("businessPointcut()")
    public Object aroundBusiness(ProceedingJoinPoint point) throws Throwable {
        Object result = null;
        long start = System.currentTimeMillis();
        result = point.proceed();
        if (result instanceof HashMap) {
            HashMap resultMap = (HashMap) result;
            if (null != resultMap.get("success") && !(boolean) resultMap.get("success")) {
                afterThrowing(point, new Exception(null != resultMap.get("message") ? resultMap.get("message").toString() : ""));
                return result;
            }
        }
        OperLogModel operLogModel = new OperLogModel();
        acquireBaseLogInfo(operLogModel, start);
        operLogModel.setSpentTime(System.currentTimeMillis() - start);
        operLogModel.setMethodName(point.getTarget().getClass().getName() + "." + point.getSignature().getName());
        logService.createOperLog(operLogModel);

        if (logger.isDebugEnabled()) {
            logger.debug("====================日志模型====================");
            logger.debug(operLogModel.toString());
            logger.debug("====================日志模型====================");
        }

        return result;
    }

    /**
     * 记录登陆日志
     */
    @Around("loginPointcut()")
    public Object aroundLogin(ProceedingJoinPoint point) throws Throwable {
        Object result = null;
        long start = System.currentTimeMillis();
        result = point.proceed();
        HashMap resultMap = (HashMap) result;
        LoginLogModel loginLogModel = new LoginLogModel();
        acquireBaseLogInfo(loginLogModel, start);
        if (null != resultMap.get("success") && !(boolean) resultMap.get("success")) {
            loginLogModel.setMessage(null != resultMap.get("message") ? resultMap.get("message").toString() : "登录失败");
        } else {
            loginLogModel.setMessage("登陆成功");
        }
        logService.createLoginLog(loginLogModel);

        if (logger.isDebugEnabled()) {
            logger.debug("====================日志模型====================");
            logger.debug(loginLogModel.toString());
            logger.debug("====================日志模型====================");
        }

        return result;
    }

    /**
     * 操作异常记录
     */
    @AfterThrowing(pointcut = "businessPointcut()", throwing = "e")
    public void afterThrowing(JoinPoint point, Throwable e) throws Exception {
        try {
            ErrLogModel errLogModel = new ErrLogModel();
            acquireBaseLogInfo(errLogModel);
            errLogModel.setException(e.toString());
            errLogModel.setMethodName(point.getTarget().getClass().getName() + "." + point.getSignature().getName());
            logService.createErrLog(errLogModel);

            if (logger.isDebugEnabled()) {
                logger.debug("====================日志模型====================");
                System.out.println(errLogModel);
                logger.debug("====================日志模型====================");
            }

            if (logger.isErrorEnabled()) {
                logger.debug("====================异常信息====================");
                logger.error("出现异常: ", e);
                logger.debug("====================异常信息====================");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void acquireBaseLogInfo(LogModel logModel, long start) {
        logModel.setHost(((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getRemoteHost());
        logModel.setAccount(null != SecurityUtils.getSubject().getPrincipal() ? SecurityUtils.getSubject().getPrincipal().toString() : "未登录");
        logModel.setOccurTime(new Timestamp(start));
        if (StringUtil.isNullOrEmpty(logModel.getAccount())) {
            logModel.setAccount("无法获取用户信息");
        }
    }

    private void acquireBaseLogInfo(LogModel logModel) {
        acquireBaseLogInfo(logModel, System.currentTimeMillis());
    }
}

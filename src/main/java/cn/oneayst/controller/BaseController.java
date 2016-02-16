package cn.oneayst.controller;

import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BaseController {
    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    public Map<String, Object> resultMap(Boolean success, String message, Object entity) {
        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("success", success);
        resultMap.put("message", message);
        resultMap.put("entity", entity);
        return resultMap;
    }

    public Map<String, Object> resultMap(Boolean success, Object entity) {
        return this.resultMap(success, null, entity);
    }

    public Map<String, Object> resultMap(Boolean success, List entity, boolean emptyNotify) {
        String message = null;
        if ((null == entity || 0 == entity.size()) && emptyNotify) {
            message = "未查询到相关数据";
        }
        return this.resultMap(success, message, entity);
    }

    /**
     * 返回实体类型一般都为query, 默认提醒没有数据时提醒
     * 对于Map类型的数据放在客户端判断有无记录
     */
    public Map<String, Object> resultMap(Boolean success, List entity) {
        return resultMap(success, entity, true);
    }

    public Map<String, Object> resultMap(Boolean success, String message) {
        return this.resultMap(success, message, null);
    }

    @ExceptionHandler
    public void exp(HttpServletResponse response, Exception e) {
        logger.debug("====================异常信息====================");
        if (logger.isErrorEnabled()) {
            logger.error("controller异常", e);
        }
        logger.debug("====================异常信息====================");
//        未取得授权异常
        if (e instanceof UnauthenticatedException || e instanceof UnauthorizedException) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        } else {
//            其他异常
            response.setStatus(9999);
        }
    }
}

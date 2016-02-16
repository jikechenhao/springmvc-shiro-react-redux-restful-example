package cn.oneayst.shiro.filter;

import cn.oneayst.shiro.token.TokenUtil;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ThreadContext;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RestAuthcFilter extends AccessControlFilter {
    @Autowired
    private TokenUtil tokenUtil;

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        return false;
    }

    /*
    * TODO 该方法内最好不要每次都使用登陆来做验证
    * 采用第一次验证成功后生成新的token并缓存
    * 以后每次访问根据前一次的token做验证
    * 验证成功则生成新的token
    * 无论成功与否都将旧token移除掉
    * */
    @Override
    protected boolean onAccessDenied(ServletRequest req, ServletResponse resp) throws Exception {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String token = request.getHeader("token");
        Subject subject = tokenUtil.getSubject(token);
        if (null != subject) {
            response.addHeader("token", tokenUtil.createAndSaveToken(subject));
            ThreadContext.unbindSubject();
            ThreadContext.bind(subject);
            return true;
        } else {
            token = request.getParameter("t");
            if (null != token && null != (subject = tokenUtil.getTempSubject(token))) {
                ThreadContext.bind(subject);
                return true;
            }

        }

        onLoginFail(response);
        return false;
    }

    private void onLoginFail(ServletResponse resp) throws IOException {
        HttpServletResponse response = (HttpServletResponse) resp;
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
    }
}

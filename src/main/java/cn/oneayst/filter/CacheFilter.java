package cn.oneayst.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CacheFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

//        TODO 此处禁止掉了所有.html和.json结尾的缓存, 以便于调试, 正式应用的时候需要调整
        final String requestUrl = request.getRequestURL().toString();
        if (requestUrl.endsWith(".html") || requestUrl.endsWith(".json")) {
            response.addHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.addHeader("Cache-Control", "pre-check=0, post-check=0");
            response.setDateHeader("Expires", 0);
        }

        chain.doFilter(req, resp);
    }

    public void destroy() {

    }
}

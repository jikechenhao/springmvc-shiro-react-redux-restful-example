package cn.oneayst.controller;

import cn.oneayst.shiro.spring.SpringCacheManagerWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CacheController {
    @Autowired
    private SpringCacheManagerWrapper cacheManagerWrapper;

    @RequestMapping("/monitor")
    public ModelAndView tm() {
        String[] cacheNames = cacheManagerWrapper.getCacheNames();
        Map<String, Object> mybatisCacheMap = new HashMap<>();
        Arrays.asList(cacheNames)
                .stream()
                .filter(cacheName -> cacheName.contains("mapper"))
                .forEach(cacheName -> mybatisCacheMap.put(cacheName.substring(18), cacheManagerWrapper.getCache(cacheName)));
        return new ModelAndView("/WEB-INF/monitor.jsp")
                .addObject("tokenCache", cacheManagerWrapper.getCache("tokenCache"))
                .addObject("shiroCache", cacheManagerWrapper.getCache("shiroCache"))
                .addObject("passwordRetryCache", cacheManagerWrapper.getCache("passwordRetryCache"))
                .addObject("mybatisCacheMap", mybatisCacheMap);
    }
}

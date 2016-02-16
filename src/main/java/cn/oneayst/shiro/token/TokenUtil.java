package cn.oneayst.shiro.token;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

@Component
public class TokenUtil {
    private Cache<String, Subject> tokenCache;
    private Map<String, Subject> tempTokenMap;

    @Autowired
    public TokenUtil(CacheManager cacheManager) {
        this.tokenCache = cacheManager.getCache("tokenCache");
        this.tempTokenMap = new ConcurrentHashMap<>();
    }

    public Cache<String, Subject> getTokenCache() {
        return tokenCache;
    }

    public Subject getSubject(String token) throws Exception {
        return tokenCache.remove(token);
    }

    public String createAndSaveToken(Subject subject) {
        String tokenStr = UUID.randomUUID().toString().replaceAll("-", "");
        tokenCache.put(tokenStr, subject);
        return tokenStr;
    }

    public String generateTempToekn(Subject subject) {
        String token = String.valueOf(System.currentTimeMillis());
        tempTokenMap.put(token, subject);
        return token;
    }

    public Subject getTempSubject(String token) {
        Subject subject = tempTokenMap.remove(token);
        return 10000 < System.currentTimeMillis() - Long.valueOf(token) ? null : subject;
    }

    public void clear() {
        tokenCache.clear();
    }
}

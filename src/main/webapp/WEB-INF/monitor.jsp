<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<%@ page session = "false" %>
<html>
<head>
    <title></title>
    <link rel = "stylesheet" href = "/css/bootstrap.min.css"/>
    <style>
        body {
            padding: 30px 0;
        }

        table {
            text-align: center;
        }

        th {
            text-align: center;
        }

        .navContainer {
            position: fixed;
            left: 20px;
            top: 20%;
            width: 250px;
        }

        .navContainer a {
            color: #333;
        }

        .tableContainer {
            margin-left: 300px;
        }
    </style>
</head>
<body>
<div>
    <div class = "navContainer">
        <ul class = "list-group">
            <li class = "list-group-item"><a href = "#tokenCache">tokenCache</a></li>
            <li class = "list-group-item"><a href = "#shiroCache">shiroCache</a></li>
            <li class = "list-group-item"><a href = "#passwordRetryCache">passwordRetryCache</a></li>
            <c:forEach items = "${mybatisCacheMap}" var = "cacheMap">
                <li class = "list-group-item"><a href = "#${cacheMap.key}">${cacheMap.key}</a></li>
            </c:forEach>
        </ul>
    </div>
    <div class = " tableContainer">
        <table id = "tokenCache" class = "table table-bordered table-striped">
            <caption><h1>令牌记录</h1></caption>
            <thead>
            <tr style = "text-align: center;">
                <th>序号</th>
                <th>令牌</th>
                <th>账号</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items = "${tokenCache.keys()}" var = "key" varStatus = "status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${key}</td>
                    <td>${tokenCache.get(key).principal}</td>
                    <td>
                        <form action = "/monitor/remove.json" method = "POST">
                            <input type = "hidden" name = "key" value = "${key}"/>
                            <button type = "submit" class = "btn btn-danger">登出</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <table id = "shiroCache" class = "table table-bordered table-striped">
            <caption><h1>授权/认证</h1></caption>
            <thead>
            <tr style = "text-align: center;">
                <th>序号</th>
                <th>账号</th>
                <th>信息</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items = "${shiroCache.keys()}" var = "key" varStatus = "status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${key}</td>
                    <c:if test = "${shiroCache.get(key).getClass().getName() eq 'org.apache.shiro.authz.SimpleAuthorizationInfo'}">
                        <td>${shiroCache.get(key).getRoles()}</td>
                    </c:if>
                    <c:if test = "${!(shiroCache.get(key).getClass().getName() eq 'org.apache.shiro.authz.SimpleAuthorizationInfo')}">
                        <td>验证用户</td>
                    </c:if>
                    <td>
                        <%--<form action = "/monitor/remove.json" method = "POST">--%>
                            <%--<input type = "hidden" name = "key" value = "${key}"/>--%>
                            <%--<button type = "submit" class = "btn btn-danger">登出</button>--%>
                        <%--</form>--%>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <table id = "passwordRetryCache" class = "table table-bordered table-striped">
            <caption><h1>密码重试</h1></caption>
            <thead>
            <tr style = "text-align: center;">
                <th>序号</th>
                <th>账号</th>
                <th>次数</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items = "${passwordRetryCache.keys()}" var = "key" varStatus = "status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${key}</td>
                    <td>${passwordRetryCache.get(key)}</td>
                    <td>
                        <%--<form action = "/monitor/remove.json" method = "POST">--%>
                            <%--<input type = "hidden" name = "key" value = "${key}"/>--%>
                            <%--<button type = "submit" class = "btn btn-danger">登出</button>--%>
                        <%--</form>--%>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:forEach items = "${mybatisCacheMap}" var = "cacheMap">

            <table id = "${cacheMap.key}" class = "table table-bordered table-striped">
                <caption><h1>${cacheMap.key}缓存</h1></caption>
                <thead>
                <tr style = "text-align: center;">
                    <th>序号</th>
                    <th>令牌</th>
                    <th>账号</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items = "${cacheMap.value.keys()}" var = "key" varStatus = "status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${key}</td>
                        <td>${cacheMap.value.get(key)}</td>
                        <td>
                            <%--<form action = "/monitor/remove.json" method = "POST">--%>
                                <%--<input type = "hidden" name = "key" value = "${key}"/>--%>
                            <%--</form>--%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:forEach>
    </div>
</div>
</body>
</html>

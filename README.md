springmvc-shiro-react-redux-restful-example
===

演示地址: https://www.oneayst.cn


5个角色的账号(密码与账号相同):  
admin  
projectmanager  
purchase  
storage  
bossboss

### 简介
这是一个虚拟项目


项目分为5个模块: 管理员  项目经理  采购部  库管 大boss  
管理员: 创建和录入项目的基本信息  
项目经理: 根据管理员录入的信息提出采购申请  
采购部: 根据项目经理的需求进行采购并录入  
库管: 查看项目信息和根据条件筛选生成表格  
大boss: 查看项目信息和生成表格

该项目使用 intellij IDEA14 开发

因为是练手项目, token加密象征性地用了BASE64而已, 实际项目中就不要这么做了.

### 多说两句
该项目整合 spring + spring mvc + shiro + react + react-router + redux实现, 意在巩固学习的知识, 同时分享出来供大家参考学习, 水平有限, 难免有不足之处, 欢迎指点交流.   
Email: 15520795512@163.com

### 如何运行
```shell
1. 导入为maven项目
2. 根据resources中的sql文件创建数据库(MySQL)
3. 修改src/main/resources/jdbc.properties中数据库账号和密码
4. 运行项目
5. cd src/main/webapp
6. npm install && npm start
```

### License
MIT ([http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php))

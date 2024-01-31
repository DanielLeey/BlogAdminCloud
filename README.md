## Blog
### 1.介绍
blog后端使用分布式SpirngCloud全家桶，前台使用Vue，分为普通用户博客网站和管理员用户管理网站
#### 普通用户网站
登录网址：
账号密码：
#### 管理员管理台网站
登录网址：
账号密码：
### 2.技术
后端：SpringCloud集成Mybatis-plus、Redis、Nacos、GateWay、OpenFeign、Seata、Sentinel
1. Nacos作为注册服务中心和配置中心。
2. Gateway中整合Spring Security作为登录认证和权限校验。
3. OpenFegin作为服务间调用工具。
4. Seata作为分布式事务的工具，启动服务作为TC服务，注册在nacos上。
5. Sentinel作为服务降级熔断的工具。
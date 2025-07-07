# 部署说明

### 1.后端部署

```bash
# 1. 克隆项目
git clone [repository-url]

# 2. 配置数据库
# 修改 application.yml 中的数据库mysql与redis连接信息

# 3. 运行项目
mvn spring-boot:run
```

### 2.前端部署

```bash
# 管理员前端
cd tourism-admin-frontend
npm install
npm run dev

# 用户前端
cd tourism-user-frontend
npm install
npm run dev
```

### 3.redis

项目用redis存储用户登录的token，运行项目时请打开redis

![image-20250704122532356](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704122532356.png)

或在本地目录下运行命令：redis-server.exe redis.windows.conf

如下图，运行3个终端，1个用户端的前端页面，1个管理员后台的前端页面，1个启动类用以启动后端

## ![image-20250704122909917](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704122909917.png)

记得打开Redis，不然没法登录！

![image-20250704123057396](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704123057396.png)

<img src="C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704123154060.png" alt="image-20250704123154060" style="zoom: 50%;" />

# 模块演示

用户端登录密码：test001 123456 ；geqian 123456；

管理端登录密码：admin 123456



## 用户端



### 1.注册模块

![image-20250704123824425](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704123824425.png)

### 2.登录模块

![image-20250704123857284](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704123857284.png)

### 3.忘记密码![image-20250704124019810](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704124019810.png)

验证码用redis接收

![image-20250704124047200](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704124047200.png)

### 4.系统主页

#### 4.1轮播图区

![image-20250704124525023](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704124525023.png)

#### 4.2推荐景点区

![image-20250704124600181](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704124600181.png)

注：1.右下角有回到顶部的按钮 2.点击预约/查看更多景点会跳转到景点模块

#### 4.3实时统计已注册的用户数

![image-20250704124738092](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704124738092.png)

目前只注册过六个用户账号

#### 4.4旅游线路区/页脚区

![image-20250704124840653](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704124840653.png)

点击查看/查看更多路线会跳转到旅游线路模块

页脚区的快速导航和服务支持中的每一个模块都可以进行跳转

### 5.景点介绍

#### 5.1景点页面

![image-20250704125442840](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704125442840.png)

#### 5.2景点预约页面

![image-20250704125542432](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704125542432.png)

点击立即预约可以进行预约

![image-20250704130156635](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130156635.png)

可以发表评论和打星

预约成功在页脚部分中找到我的订单这一项，这里面保存了景点预约与酒店预约的记录

### 6.旅游线路

![image-20250704125841568](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704125841568.png)

### 7.景区酒店

#### 7.1景区页面

![image-20250704125956446](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704125956446.png)

#### 7.2景区预约页面

![image-20250704130047591](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130047591.png)

点击立即预约可以进行预约

![image-20250704130136582](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130136582.png)

床型可在管理端进行增删改

### 8.美食推荐

#### 8.1美食页面

![image-20250704130344398](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130344398.png)

#### 8.2美食详情页面

![image-20250704130418391](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130418391.png)

用户可打分和发表评论

### 9.汉文化活动

#### 9.1汉文化页面![image-20250704130509238](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130509238.png)

#### 9.2汉文化活动预约页面![image-20250704130546602](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130546602.png)

### 10.旅游攻略

![image-20250704130627462](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130627462.png)

### 11.联系我们

![image-20250704130645603](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130645603.png)

用户可以留言，管理员在管理端能看到这些留言并进行处理

### 12.个人中心（点击头像进入）

![image-20250704130836586](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130836586.png)

可以修改头像/修改密码





## 管理端

### 1.首页

![image-20250704130919061](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704130919061.png)

主要是统计页面，统计近七天的景点预约和酒店预约数据

### 2.景点管理

![image-20250704131019149](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704131019149.png)

增删改查，上架，下架，查看景点评论等功能

![image-20250704131431722](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704131431722.png)

### 3.线路管理

![image-20250704131114914](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704131114914.png)

对旅游线路模块进行增删改查

### 4.酒店管理

![image-20250704131400808](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704131400808.png)

可以添加对某个房型进行增删改查

![image-20250704131614585](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704131614585.png)

### 5.咨询管理（旅游攻略管理）

![image-20250704131701289](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704131701289.png)

对旅游攻略进行增删改查

### 6.景点预约

![image-20250704131755783](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704131755783.png)

这里展示了所有用户景点预约信息，管理员可以处理这些预约

### 7.酒店预约

![image-20250704131948872](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704131948872.png)

这里展示了所有用户酒店预约信息，管理员可以处理这些预约

### 8.轮播图管理

![image-20250704132453408](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704132453408.png)

对轮播图进行增删改查，这些轮播图用于用户端的首页中

### 9.美食推荐

![image-20250704132536894](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704132536894.png)

对美食进行增删改查，上架，下架，推荐打分

### 10.汉文化活动

![image-20250704132630645](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704132630645.png)

对汉文化进行增删改查，上架下架

### 11.联系我们

![image-20250704132705781](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704132705781.png)

对用户端的联系我们进行增删改查，启动，禁用

### 12.用户留言

![image-20250704132809133](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704132809133.png)

这里可以看到所有用户在联系我们这一页面下的的留言，管理员可以对留言进行处理

### 13.管理员个人中心

![image-20250704132943110](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704132943110.png)

修改管理员密码，管理员头像，管理员个人信息

### 14.用户管理

#### 14.1管理员管理

![image-20250704133041855](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704133041855.png)

#### 14.2用户管理

![image-20250704133114634](C:\Users\wanglei\AppData\Roaming\Typora\typora-user-images\image-20250704133114634.png)

超级管理员可以添加其他管理员，普通用户，可以删除，修改，重置密码。



****
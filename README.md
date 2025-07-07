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
![image](https://github.com/user-attachments/assets/9b935f6f-5791-4448-8587-942e5eb72529)


或在本地目录下运行命令：redis-server.exe redis.windows.conf

如下图，运行3个终端，1个用户端的前端页面，1个管理员后台的前端页面，1个启动类用以启动后端

![image](https://github.com/user-attachments/assets/7af561c4-c1ca-482a-8afb-495f8baa9620)



记得打开Redis，不然没法登录！

![image](https://github.com/user-attachments/assets/2cf143a3-26e5-41f7-8f72-6dca5781a366)


![image](https://github.com/user-attachments/assets/261c651a-b59a-4064-aada-d7147f25d787)


# 模块演示

用户端登录密码：test001 123456 ；geqian 123456；

管理端登录密码：admin 123456



## 用户端



### 1.注册模块

![image](https://github.com/user-attachments/assets/e03fa0df-6caa-40d7-a5ed-c75e783a1da8)



### 2.登录模块

![image](https://github.com/user-attachments/assets/f9af04f9-4fde-47ea-b16a-db564dee17d2)


### 3.忘记密码
![image](https://github.com/user-attachments/assets/7efaf79b-02f9-4a4c-aed4-7f0cad06a17c)


验证码用redis接收

![image](https://github.com/user-attachments/assets/3e250efb-44c0-42d7-a381-d295a62ef8fe)


### 4.系统主页

#### 4.1轮播图区

![image](https://github.com/user-attachments/assets/e6e46b31-2c88-4a93-bd0d-36d40927c1c5)


#### 4.2推荐景点区

![image](https://github.com/user-attachments/assets/b5b8298c-ed4f-4f8f-9e6f-568000c13680)


注：1.右下角有回到顶部的按钮 2.点击预约/查看更多景点会跳转到景点模块

#### 4.3实时统计已注册的用户数

![image](https://github.com/user-attachments/assets/2f2974dd-4228-4e9d-a148-cce42b97e9a1)


目前只注册过六个用户账号

#### 4.4旅游线路区/页脚区

![image](https://github.com/user-attachments/assets/074b32f7-787a-4836-9631-1f7d123a8041)


点击查看/查看更多路线会跳转到旅游线路模块

页脚区的快速导航和服务支持中的每一个模块都可以进行跳转

### 5.景点介绍

#### 5.1景点页面

![image](https://github.com/user-attachments/assets/c2a67a84-a9e0-40b1-a819-4363638938ba)


#### 5.2景点预约页面

![image](https://github.com/user-attachments/assets/e5b21679-7284-46f7-9fbc-e520d9511191)


点击立即预约可以进行预约

![image](https://github.com/user-attachments/assets/e6618285-3aeb-4b06-b3fe-1ea16049c22c)


可以发表评论和打星

预约成功在页脚部分中找到我的订单这一项，这里面保存了景点预约与酒店预约的记录

### 6.旅游线路

![image](https://github.com/user-attachments/assets/9a198bed-dd74-4317-92b8-d7a5e4a202be)


### 7.景区酒店

#### 7.1景区页面

![image](https://github.com/user-attachments/assets/bcd6b9a0-d6b1-44b2-a7ff-d1368f956777)


#### 7.2景区预约页面

![image](https://github.com/user-attachments/assets/b15a8fe9-be9f-4184-a519-f34bc01c5df9)


点击立即预约可以进行预约

![image](https://github.com/user-attachments/assets/bc93689c-4cae-4a0c-8828-7bf315cced01)


床型可在管理端进行增删改

### 8.美食推荐

#### 8.1美食页面

![image](https://github.com/user-attachments/assets/23ab2120-763d-4863-a764-31f424d1e721)


#### 8.2美食详情页面

![image](https://github.com/user-attachments/assets/ba7760e7-9f18-450b-81e4-aa988a206e8e)


用户可打分和发表评论

### 9.汉文化活动

#### 9.1汉文化页面
![image](https://github.com/user-attachments/assets/dbad1b8c-a963-422f-a652-7332a0405a0b)


#### 9.2汉文化活动预约页面
![image](https://github.com/user-attachments/assets/704212cc-4b55-4f57-9783-8a37aec77ace)


### 10.旅游攻略

![image](https://github.com/user-attachments/assets/dbc7b8b8-4adf-45fd-90c9-848339c782f0)


### 11.联系我们
![image](https://github.com/user-attachments/assets/6612219a-d1d4-4ebd-b45a-f4fbf1829e19)


用户可以留言，管理员在管理端能看到这些留言并进行处理

### 12.个人中心（点击头像进入）

![image](https://github.com/user-attachments/assets/9ef50ee2-5e61-4bd4-979b-f4eda615d75b)


可以修改头像/修改密码





## 管理端

### 1.首页

![image](https://github.com/user-attachments/assets/6142d789-2640-4816-9a95-eeffbf66dd06)


主要是统计页面，统计近七天的景点预约和酒店预约数据

### 2.景点管理

![image](https://github.com/user-attachments/assets/8997ee77-1335-4b1f-8564-ef61c02f90eb)


增删改查，上架，下架，查看景点评论等功能

![image](https://github.com/user-attachments/assets/4f361f9a-a35d-4637-ae72-dc4808e03bd9)


### 3.线路管理

![image](https://github.com/user-attachments/assets/c7d4c3ed-09ec-4de6-9976-ca4b2a909d73)


对旅游线路模块进行增删改查

### 4.酒店管理

![image](https://github.com/user-attachments/assets/adda1496-bf5a-473f-b5e9-e0491950fc86)


可以添加对某个房型进行增删改查

![image](https://github.com/user-attachments/assets/298cf66e-1b77-439a-a19a-5e22870c3015)


### 5.咨询管理（旅游攻略管理）

![image](https://github.com/user-attachments/assets/c6b01d26-ff8c-4423-a005-f547655f4ac0)


对旅游攻略进行增删改查

### 6.景点预约

![image](https://github.com/user-attachments/assets/f58faa55-8a90-43e4-a6ca-cb6a039c88bd)


这里展示了所有用户景点预约信息，管理员可以处理这些预约

### 7.酒店预约

![image](https://github.com/user-attachments/assets/df84720e-c686-41f3-aebd-254030cc90d8)


这里展示了所有用户酒店预约信息，管理员可以处理这些预约

### 8.轮播图管理

![image](https://github.com/user-attachments/assets/fa027900-57c4-423b-a988-8325300ebe99)


对轮播图进行增删改查，这些轮播图用于用户端的首页中

### 9.美食推荐

![image](https://github.com/user-attachments/assets/674f6e11-9bc4-45fd-9d0b-7df92b77dab1)


对美食进行增删改查，上架，下架，推荐打分

### 10.汉文化活动

![image](https://github.com/user-attachments/assets/f4e55e36-4c8a-41aa-8847-d5938cd8a05d)


对汉文化进行增删改查，上架下架

### 11.联系我们

![image](https://github.com/user-attachments/assets/f1606b1b-cf46-4e4b-81b8-2291b10186ea)


对用户端的联系我们进行增删改查，启动，禁用

### 12.用户留言

![image](https://github.com/user-attachments/assets/c8f656b9-5936-46b4-88fc-f16d1bb214b0)


这里可以看到所有用户在联系我们这一页面下的的留言，管理员可以对留言进行处理

### 13.管理员个人中心

![image](https://github.com/user-attachments/assets/030c1447-8526-4c59-920b-5b148625d7b4)


修改管理员密码，管理员头像，管理员个人信息

### 14.用户管理

#### 14.1管理员管理

![image](https://github.com/user-attachments/assets/db16a8bc-2453-4a25-9e3c-78d3ce6d3d1e)


#### 14.2用户管理

![image](https://github.com/user-attachments/assets/4dee74f6-1e43-4732-8404-42370dd2231b)


超级管理员可以添加其他管理员，普通用户，可以删除，修改，重置密码。



****

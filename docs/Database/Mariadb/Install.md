## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- [mariadb 官网下载](https://downloads.mariadb.org/)

## **步骤说明**

**1. 下载安装包后双击运行，安装过程如下：**

![安装过程1](../../img/db_img/ma1.png)
![安装过程2](../../img/db_img/ma2.png)
![修改安装路径](../../img/db_img/ma3.png)
![配置密码和编码](../../img/db_img/ma4.png)
![配置端口号](../../img/db_img/ma5.png)
![安装](../../img/db_img/ma6.png)

- 添加环境变量

![添加环境变量1](../../img/db_img/ma7.png)
![添加环境变量2](../../img/db_img/ma8.png)

**2. 查看版本号,在命令行窗口运行如下代码：**

```@cmd
mysql -V
```

![查看版本号](../../img/db_img/ma9.png)

**3. 使用 Navicat 管理 Mariadb 数据库**

```@cmd
mysql -u root -p  #使用root用户连接数据库
show databases; #查看所有数据库
use db_name   #use+数据库名
```

![命令行连接](../../img/db_img/ma10.png)
![navicat连接](../../img/db_img/ma11.png)

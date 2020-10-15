## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- Redis version 5.0.9

## **步骤说明**

**1. 实例**

- 在 Redis 安装目录下依次执行如下命令：

```cmd
redis-server.exe redis.windows.conf
redis-cli.exe -h 127.0.0.1 -p 6379
AUTH PASSWORD
CONFIG SET requirepass "mypass"
AUTH mypass
```

**2. 连接命令**

| 序号 | 命令          | 描述               |
| ---- | ------------- | ------------------ |
| 1    | AUTH password | 验证密码是否正确   |
| 2    | ECHO message  | 打印字符串         |
| 3    | PING          | 查看服务是否运行   |
| 4    | QUIT          | 关闭当前连接       |
| 5    | SELECT index  | 切换到指定的数据库 |

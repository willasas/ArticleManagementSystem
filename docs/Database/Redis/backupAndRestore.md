## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- Redis version 5.0.9
- [redis 在线测试](https://try.redis.io/)

## **步骤说明**

**1. 备份**

```cmd
SAVE #会在 redis 安装目录中创建dump.rdb文件
```

**2. 恢复数据**

- 需将备份文件 (dump.rdb) 移动到 redis 安装目录并启动服务即可。获取 redis 目录可以使用 CONFIG 命令

```cmd
CONFIG GET dir
```

**3. BGSAVE（创建 redis 备份文件）**

```cmd
BGSAVE
```

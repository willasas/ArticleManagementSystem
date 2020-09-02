## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- Redis version 5.0.9

## **步骤说明**

**1. 客户端连接**

- Redis 通过监听一个 TCP 端口或者 Unix socket 的方式来接收来自客户端的连接，当一个连接建立后，Redis 内部会进行以下一些操作：
  - 首先，客户端 socket 会被设置为非阻塞模式，因为 Redis 在网络事件处理上采用的是非阻塞多路复用模型。
  - 然后为这个 socket 设置 TCP_NODELAY 属性，禁用 Nagle 算法
  - 然后创建一个可读的文件事件用于监听这个客户端 socket 的数据发送

**2. 最大连接数**

- maxclients 的默认值是 10000，你也可以在 redis.conf 中对这个值进行修改

```cmd
redis-server --maxclients 100000 #在redis根目录执行，在服务启动时设置最大连接数为 100000
```

**3. 客户端命令**

| 序号 | 命令           | 描述                                       |
| ---- | -------------- | ------------------------------------------ |
| 1    | CLIENT LIST    | 返回连接到 redis 服务的客户端列表          |
| 2    | CLIENT SETNAME | 设置当前连接的名称                         |
| 3    | CLIENT GETNAME | 获取通过 CLIENT SETNAME 命令设置的服务名称 |
| 4    | CLIENT PAUSE   | 挂起客户端连接，指定挂起的时间以毫秒计     |
| 5    | CLIENT KILL    | 关闭客户端连接                             |

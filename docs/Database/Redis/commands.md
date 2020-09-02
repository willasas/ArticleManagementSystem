## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- Redis version 5.0.9

## **步骤说明**

**1. 打开命令行工具，进到 redis 所在目录,运行如下代码：**

```cmd
redis-cli --raw  #启动redis客户端，--raw:避免中文乱码
PING  #用于检测redis服务是否启动
```

**2. 在远程服务上执行命令,运行如下代码：**

```@cmd
redis-cli.exe -h 127.0.0.1 -p 6379 -a "1234"  #连接到主机为127.0.0.1，端口为6379 ，密码为 1234的redis服务上
```

**3. 常用命令**

| 序号 | 命令                                     | 描述                                                                                                                          |
| ---- | ---------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| 1    | DEL key                                  | 用于在 key 存在时删除 key                                                                                                     |
| 2    | DUMP key                                 | 序列化给定 key ，并返回被序列化的值                                                                                           |
| 3    | EXISTS key                               | 检查给定 key 是否存在                                                                                                         |
| 4    | EXPIRE key seconds                       | 为给定 key 设置过期时间，以秒计                                                                                               |
| 5    | EXPIREAT key timestamp                   | EXPIREAT 的作用和 EXPIRE 类似，都用于为 key 设置过期时间。 不同在于 EXPIREAT 命令接受的时间参数是 UNIX 时间戳(unix timestamp) |
| 6    | PEXPIRE key milliseconds                 | 设置 key 的过期时间以毫秒计                                                                                                   |
| 7    | PEXPIREAT key milliseconds-timestamp     | 设置 key 过期时间的时间戳(unix timestamp) 以毫秒计                                                                            |
| 8    | KEYS pattern                             | 查找所有符合给定模式( pattern)的 key                                                                                          |
| 9    | MOVE key db                              | 将当前数据库的 key 移动到给定的数据库 db 当中                                                                                 |
| 10   | PERSIST key                              | 移除 key 的过期时间，key 将持久保持                                                                                           |
| 11   | PTTL key                                 | 以毫秒为单位返回 key 的剩余的过期时间                                                                                         |
| 12   | TTL key                                  | 以秒为单位，返回给定 key 的剩余生存时间(TTL, time to live)                                                                    |
| 13   | RANDOMKEY                                | 从当前数据库中随机返回一个 key                                                                                                |
| 14   | RENAME key newkey                        | 修改 key 的名称                                                                                                               |
| 15   | RENAMENX key newkey                      | 仅当 newkey 不存在时，将 key 改名为 newkey                                                                                    |
| 16   | SCAN cursor [MATCH pattern][count count] | 迭代数据库中的数据库键                                                                                                        |
| 17   | TYPE key                                 | 返回 key 所储存的值的类型                                                                                                     |

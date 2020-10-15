## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- Redis version 5.0.9
- [redis 在线测试](https://try.redis.io/)

## **步骤说明**

**1. 实例**

- 获取 redis 服务器的统计信息：

```cmd
info
# Server
redis_version:6.0.7
redis_git_sha1:00000000
redis_git_dirty:0
redis_build_id:fd9693d2168083ef
redis_mode:standalone
os:Linux 5.4.0-1017-aws x86_64
arch_bits:64
multiplexing_api:epoll
gcc_version:9.3.0
process_id:3426926
run_id:2ed5b84678f425dd3266032825308964b2a996cc
tcp_port:6379
uptime_in_seconds:95054
uptime_in_days:1
hz:10
lru_clock:5202860

# Clients
connected_clients:3
blocked_clients:0

# Memory
used_memory:16603520
used_memory_human:15.83M
used_memory_rss:21598208
used_memory_peak:16621944
used_memory_peak_human:15.85M
used_memory_lua:37888
mem_fragmentation_ratio:1.31
mem_allocator:jemalloc-5.1.0

# Persistence
loading:0
rdb_changes_since_last_save:391367
rdb_bgsave_in_progress:0
rdb_last_save_time:1598943326
rdb_last_bgsave_status:ok
rdb_last_bgsave_time_sec:-1
rdb_current_bgsave_time_sec:-1
aof_enabled:0
aof_rewrite_in_progress:0
aof_rewrite_scheduled:0
aof_last_rewrite_time_sec:-1
aof_current_rewrite_time_sec:-1
aof_last_bgrewrite_status:ok

# Stats
total_connections_received:15129
total_commands_processed:938236
instantaneous_ops_per_sec:11
rejected_connections:0
sync_full:0
sync_partial_ok:0
sync_partial_err:0
expired_keys:2662
evicted_keys:0
keyspace_hits:216582
keyspace_misses:100455
pubsub_channels:0
pubsub_patterns:0
latest_fork_usec:0
migrate_cached_sockets:0

# Replication
role:master
connected_slaves:0
master_repl_offset:0
repl_backlog_active:0
repl_backlog_size:1048576
repl_backlog_first_byte_offset:0
repl_backlog_histlen:0

# CPU
used_cpu_sys:67.330258
used_cpu_user:93.427275
used_cpu_sys_children:0.000000
used_cpu_user_children:0.000000

# Cluster
cluster_enabled:0

# Keyspace
db0:keys=88107,expires=2,avg_ttl=668976934
```

**2. 服务器相关命令**

| 序号 | 命令                                         | 描述                                                                    |
| ---- | -------------------------------------------- | ----------------------------------------------------------------------- |
| 1    | BGREWRITEAOF                                 | 异步执行一个 AOF（AppendOnly File） 文件重写操作                        |
| 2    | BGSAVE                                       | 在后台异步保存当前数据库的数据到磁盘                                    |
| 3    | CLIENT KILL [ip:port] [ID client-id]         | 关闭客户端连接                                                          |
| 4    | CLIENT LIST                                  | 获取连接到服务器的客户端连接列表                                        |
| 5    | CLIENT GETNAME                               | 获取连接的名称                                                          |
| 6    | CLIENT PAUSE timeout                         | 在指定时间内终止运行来自客户端的命令                                    |
| 7    | CLIENT SETNAME connection-name               | 设置当前连接的名称                                                      |
| 8    | CLUSTER SLOTS                                | 获取集群节点的映射数组                                                  |
| 9    | COMMAND                                      | 获取 Redis 命令详情数组                                                 |
| 10   | COMMAND COUNT                                | 获取 Redis 命令总数                                                     |
| 11   | COMMAND GETKEYS                              | 获取给定命令的所有键                                                    |
| 12   | TIME                                         | 返回当前服务器时间                                                      |
| 13   | COMMAND INFO command-name [command-name ...] | 获取指定 Redis 命令描述的数组                                           |
| 14   | CONFIG GET parameter                         | 获取指定配置参数的值                                                    |
| 15   | CONFIG REWRITE                               | 对启动 Redis 服务器时所指定的 redis.conf 配置文件进行改写               |
| 16   | CONFIG SET parameter value                   | 修改 redis 配置参数，无需重启                                           |
| 17   | CONFIG RESETSTAT                             | 重置 INFO 命令中的某些统计数据                                          |
| 18   | DBSIZE                                       | 返回当前数据库的 key 的数量                                             |
| 19   | DEBUG OBJECT key                             | 获取 key 的调试信息                                                     |
| 20   | DEBUG SEGFAULT                               | 让 Redis 服务崩溃                                                       |
| 21   | FLUSHALL                                     | 删除所有数据库的所有 key                                                |
| 22   | FLUSHDB                                      | 删除当前数据库的所有 key                                                |
| 23   | INFO [section]                               | 获取 Redis 服务器的各种信息和统计数值                                   |
| 24   | LASTSAVE                                     | 返回最近一次 Redis 成功将数据保存到磁盘上的时间，以 UNIX 时间戳格式表示 |
| 25   | MONITOR                                      | 实时打印出 Redis 服务器接收到的命令，调试用                             |
| 26   | ROLE                                         | 返回主从实例所属的角色                                                  |
| 27   | SAVE                                         | 同步保存数据到硬盘                                                      |
| 28   | SHUTDOWN [NOSAVE] [SAVE]                     | 异步保存数据到硬盘，并关闭服务器                                        |
| 29   | SLAVEOF host port                            | 将当前服务器转变为指定服务器的从属服务器(slave server)                  |
| 30   | SLOWLOG subcommand [argument]                | 管理 redis 的慢日志                                                     |
| 31   | SYNC                                         | 用于复制功能(replication)的内部命令                                     |

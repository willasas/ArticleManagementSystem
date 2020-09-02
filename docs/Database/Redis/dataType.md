## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- Redis version 5.0.9

## **步骤说明**

**1. Redis 数据类型**

- Redis 支持五种数据类型：string（字符串），hash（哈希），list（列表），set（集合）及 zset(sorted set：有序集合)。

| 类型                      | 简介                                                        | 特性                                                                                               | 使用场景                                                                                                 |
| ------------------------- | ----------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| String(字符串)            | 二进制安全                                                  | 一个 key 对应一个 value，可以包含任何数据（比如 jpg 图片或者序列化的对象），一个键最大能存储 512MB | ---                                                                                                      |
| Hash(哈希)                | 键值(key=>value)对集合，即编程语言中的 Map 类型             | 适合用于存储对象，每个 hash 可以存储 2^32 -1 键值对（40 多亿）                                     | 存储、读取、修改用户属性                                                                                 |
| List(列表)                | 链表（双向链表）                                            | 增删快,提供了操作某一段元素的 API，最多可存储 2^32 -1 元素 (4294967295, 每个列表可存储 40 多亿)    | 1,最新消息排行等功能(比如朋友圈的时间线) 2,消息队列                                                      |
| Set(集合)                 | 哈希表实现,元素不重复                                       | 1、添加、删除,查找的复杂度都是 O(1) 2、为集合提供了求交集、并集、差集等操作                        | 1、共同好友 2、利用唯一性,统计访问网站的所有独立 ip 3、好友推荐时,根据 tag 求交集,大于某个阈值就可以推荐 |
| ZSet(sorted set:有序集合) | 将 Set 中的元素增加一个权重参数 score,元素按 score 有序排列 | 数据插入集合时,已经进行天然排序                                                                    | 1、排行榜 2、带权重的消息队列                                                                            |

**2. 例子如下**

- string 例子

```redis
GET test "测试"
SET test
```

- hash 例子

```redis
HMSET test field1 "Hello" field2 "World"
HGET test field1
HGET test field2
```

- list 例子

```redis
DEL test
lpush test list1
lpush test list2
lpush test list3
lrange test 0 10
```

- set 例子

```redis
sadd test1 member1
sadd test1 member1  #根据集合内元素的唯一性，第二次插入的元素将被忽略
sadd test1 member2
sadd test1 member3
smembers test1    #查看
```

- zset 例子

```redis
DEL test1  #删除相同集合
zadd test1 0 member1
zadd test1 0 member2
zadd test1 0 member3
zadd test1 0 member3
ZRANGEBYSCORE test1 0 1000  #0:最小值， 1000：最大值
```

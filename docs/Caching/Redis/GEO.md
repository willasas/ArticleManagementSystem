## **环境说明**

#### 准备工作

- Windows 10 2004 版本（Windows 系统）
- Redis version 5.0.9
- [redis 在线测试](https://try.redis.io/)

## **步骤说明**

**1. 操作方法**

- Redis GEO 主要用于存储地理位置信息，并对存储的信息进行操作
- 操作方法：
  - geoadd：添加地理位置的坐标。
  - geopos：获取地理位置的坐标。
  - geodist：计算两个位置之间的距离。
  - georadius：根据用户给定的经纬度坐标来获取指定范围内的地理位置集合。
  - georadiusbymember：根据储存在位置集合里面的某个地点获取指定范围内的地理位置集合。
  - geohash：返回一个或多个位置对象的 geohash 值。

**2. geoadd 用于存储指定的地理空间位置，可以将一个或多个经度(longitude)、纬度(latitude)、位置名称(member)添加到指定的 key 中**

```cmd
# 语法：GEOADD key longitude latitude member [longitude latitude member ...]
GEOADD Sicily 13.361389 38.115556 "Palermo" 15.087269 37.502669 "Catania"
GEODIST Sicily Palermo Catania
GEORADIUS Sicily 15 37 100 km
GEORADIUS Sicily 15 37 200 km
```

**3. geopos 用于从给定的 key 里返回所有指定名称(member)的位置（经度和纬度），不存在的返回 nil**

```cmd
GEOADD Sicily 13.361389 38.115556 "Palermo" 15.087269 37.502669 "Catania"
GEOPOS Sicily Palermo Catania NonExisting
```

**4. geodist 用于返回两个给定位置之间的距离**

```cmd
# 语法：GEODIST key member1 member2 [m|km|ft|mi] member1 member2 为两个地理位置。最后一个距离单位参数说明：m ：米，默认单位。km ：千米。mi ：英里。ft ：英尺。
# 计算Palermo 与 Catania 之间的距离
GEOADD Sicily 13.361389 38.115556 "Palermo" 15.087269 37.502669 "Catania"
GEODIST Sicily Palermo Catania
GEODIST Sicily Palermo Catania km
GEODIST Sicily Palermo Catania mi
GEODIST Sicily Foo Bar
```

**5. georadius 以给定的经纬度为中心， 返回键包含的位置元素当中， 与中心的距离不超过给定最大距离的所有位置元素。georadiusbymember 和 GEORADIUS 命令一样， 都可以找出位于指定范围内的元素， 但是 georadiusbymember 的中心点是由给定的位置元素决定的， 而不是使用经度和纬度来决定中心点。**

```cmd
# 语法：GEORADIUS key longitude latitude radius m|km|ft|mi [WITHCOORD] [WITHDIST] [WITHHASH] [COUNT count] [ASC|DESC] [STORE key] [STOREDIST key]
GEORADIUSBYMEMBER key member radius m|km|ft|mi [WITHCOORD] [WITHDIST] [WITHHASH] [COUNT count] [ASC|DESC] [STORE key] [STOREDIST key]

# georadius实例：
GEOADD Sicily 13.361389 38.115556 "Palermo" 15.087269 37.502669 "Catania"
GEORADIUS Sicily 15 37 200 km WITHDIST
GEORADIUS Sicily 15 37 200 km WITHCOORD
GEORADIUS Sicily 15 37 200 km WITHDIST WITHCOORD

# georadiusbymember实例：
GEOADD Sicily 13.583333 37.316667 "Agrigento"
GEOADD Sicily 13.361389 38.115556 "Palermo" 15.087269 37.502669 "Catania"
GEORADIUSBYMEMBER Sicily Agrigento 100 km
```

- 参数说明：
  - m ：米，默认单位。
  - km ：千米。
  - mi ：英里。
  - ft ：英尺。
  - WITHDIST: 在返回位置元素的同时， 将位置元素与中心之间的距离也一并返回。
  - WITHCOORD: 将位置元素的经度和维度也一并返回。
  - WITHHASH: 以 52 位有符号整数的形式， 返回位置元素经过原始 geohash 编码的有序集合分值。 这个选项主要用于底层应用或者调试， 实际中的作用并不大。
  - COUNT 限定返回的记录数。
  - ASC: 查找结果根据距离从近到远排序。
  - DESC: 查找结果根据从远到近排序

**6. geohash 用于获取一个或多个位置元素的 geohash 值**

```cmd
# 语法：GEOHASH key member [member ...]
GEOADD Sicily 13.361389 38.115556 "Palermo" 15.087269 37.502669 "Catania"
GEOHASH Sicily Palermo Catania
```

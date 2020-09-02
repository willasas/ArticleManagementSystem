## **环境说明**

#### 准备工作

- CentOS 7

## **步骤说明**

**1. Syslog-ng(syslog-Next generation)特点**

- 高性能
- 支持多平台
- 高可靠性
- 众多的用户群体
- 强大的日志过滤及排序
- 事件标签和关联性
- 支持最新的 IETF 标准

**2. 设计原则**

- 通过正则表达式协助，除支持原 facitily/level 方式，还支持内容过滤等以建立更好的消息过滤机制。
- 支持主机链，即使日志消息经过多重网络转发，仍可找到原发出主机的信息和整个消息链。
- 支持强大的自定义配置，并且清晰、明了。

**3. syslog-ng 安装**

```@Terminal
wget http://www.balabit.com/downloads/files/syslog-ng/sources/3.2.4/source/eventlog_0.2.12.tar.gz
wget http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.3.5/source/syslog-ng_3.3.5.tar.gz
tar xvf eventlog_0.2.12.tar.gz
cd eventlog-0.2.12
./configure --prefix=/usr/local/eventlog
make
make install

cd /usr/src
tar xvf syslog-ng_3.3.5.tar.gz
cd syslog-ng-3.3.5
export PKG_CONFIG_PATH=/usr/local/eventlog/lib/pkgconfig
./configure --prefix=/usr/local/syslog-ng
make
make install
```

**4. syslog-ng 配置文件介绍**

- 其配置文件目录为/etc/syslog-ng/syslog-ng.conf，配置文件的格式一般由以下 5 个部分组成：

```@Terminal
options { };
  #全局选项,多个选项时用分好";"隔开
source S_NAME { };
  #定义日志源可以是本地也可以是远程主机
filter F_NAME { };
  #定义过滤规则，规则可以使用正则表达式来定义;可略
destination D_NAME { };
  #定义目标可以本地也可以是远程主机
log { };
  #此段将来源,目的,过滤都给连接起来并且告诉syslog-ng如何处理日志
----------------------------------------------------------------
options { option1;option2}
sourceS_NAME { source-driver(params);source-driver(params);... };
filter F_NAME {expression;};
destination D_NAME { dest-driver(params); dest-driver(params);…};
log { source(S_NAME); filter(F_NAME); destination(D_NAME) }
options { long_hostnames(off); sync(0); perm(0640); stats(3600); };
```

**5. 其他配置项**

```@Terminal
  chain_hostnames(yes|no)  #是否打开主机名链功能打开后可在多网络段转发日志时有效
  long_hostnames(yes|no)   #是chain_hostnames的别名已不建议使用
  keep_hostname(yes|no)    #是否保留日志消息中保存的主机名称
  use_dns(yes|no)          #是否打开DNS查询功能
  use_fqdn(yes|no)         #是否使用完整的域名
  check_hostname(yes|no)   #是否检查主机名有没有包含不合法的字符
  bad_hostname(regexp)     #可通过正规表达式指定某主机的信息不被接受
  dns_cache(yes|no)        #是否打开DNS缓存功能
  dns_cache_expire(n)      #DNS缓存功能打开时，一个成功缓存的过期时间
  dns_cache_expire_failed(n) #DNS缓存功能打开时，一个失败缓存的过期时间
  dns_cache_size(n)        #DNS缓存保留的主机名数量
  create_dirs(yes|no)      #当指定的目标目录不存在时，是否创建该目录
  dir_owner(uid)           #目录的UID
  dir_perm(perm)           #目录的权限，使用八进制方式标注，例如0644
  dir_group(gid)           #目录的GID
  dir_perm(perm)           #目录的权限，使用八进制方式标注，例如0644
  owner(uid)               #文件的UID
  group(gid)               #文件的GID
  perm(perm)               #文件的权限，同样，使用八进制方式标注
  gc_busy_threshold(n)     #当syslog-ng忙时，其进入垃圾信息收集状态的时间一旦分派的对象达到这个数字，syslog-ng就启动垃圾信息收集状态。默认3000
  gc_idle_threshold(n)     #当syslog-ng空闲时，其进入垃圾信息收集状态的时间一旦被分派的对象到达这个数字，syslog-ng就会启动垃圾信息收集状态，默认100
  log_fifo_size(n)         #输出队列的行数
  log_msg_size(n)          #消息日志的最大值（bytes）
  mark(n)                  #多少时间（秒）写入两行MARK信息供参考，目前没有实现
  stats(n)                 #多少时间（秒）写入两行STATUS信息,默认值是：600
  sync(n)                  #缓存多少行的信息再写入文件中，0为不缓存，局部参数可以覆盖该值
  time_reap(n)             #在没有消息前，到达多少秒，即关闭该文件的连接
  time_reopen(n)           #对于死连接，到达多少秒，会重新连接
  use_time_recvd(yes|no)   #宏产生的时间是使用接受到的时间还是日志中记录时间；建议使用R_的宏代替接收时间，S_的宏代替日志记录的时间，而不要依靠该值定义

source s_name { internal(); unix-dgram("/dev/log"); udp(ip("0.0.0.0") port(514)); };
下面是Syslog-ng支持的消息源:
  file (filename)          #从指定的文件读取日志信息
  unix-dgram  (filename)   #打开指定的SOCK_DGRAM模式的unix套接字，接收日志消息
  unix-stream (filename)   #打开指定的SOCK_STREAM模式的unix套接字，接收日志消息
  udp ( (ip),(port) )      #在指定的UDP端口接收日志消息
  tcp ( (ip),(port) )      #在指定的TCP端口接收日志消息
  sun-streams (filename)   #在solaris系统中，打开一个（多个）指定的STREAM设备，从其中读取日志消息
  internal()               #syslog-ng内部产生的消息
  pipe(filename),fifo(filename)  #从指定的管道或者FIFO设备，读取日志信息

filter f_name   { not facility(news, mail) and not filter(f_iptables); };
更多规则函数如下:
  facility(..)             #根据facility（设备）选择日志消息，使用逗号分割多个facility
  level(..)                #根据level（优先级）选择日志消息，使用逗号分割多个level，或使用“..”表示一个范围
  program(表达式)           #日志消息的程序名是否匹配一个正则表达式
  host(表达式)              #日志消息的主机名是否和一个正则表达式匹配
  match(表达式)             #对日志消息的内容进行正则匹配
  filter()                 #调用另一条过滤规则并判断它的值

destination d_name { file("/var/log/messages"); };
更多动作如下:
  file (filename)          #把日志消息写入指定的文件
  unix-dgram  (filename)   #把日志消息写入指定的SOCK_DGRAM模式的unix套接字
  unix-stream (filename)   #把日志消息写入指定的SOCK_STREAM模式的unix套接字
  udp (ip),(port)          #把日志消息发送到指定的UDP端口
  tcp (ip),(port)          #把日志消息发送到指定的TCP端口
  usertty(username)        #把日志消息发送到已经登陆的指定用户终端窗口
  pipe(filename),fifo(filename)  #把日志消息发送到指定的管道或者FIFO设备
  program(parm)                  #启动指定的程序，并把日志消息发送到该进程的标准输入

log { source(s_name); filter(f_name); destination(d_name) };
把消息源、过滤器、消息目的组合起来就形成一条完整的指令。日志路径中的成员是顺序执行的凡是来源于指定的消息源，匹配所有指定的过滤器，并送到指定的地址。
同样的，每条日志消息都会经过所有的消息路径，并不是匹配后就不再往下执行的请留意。
一条日志的处理流程大概是这样的,如下:
首先是 "日志的来源-source s_name { ... };"
然后是 "过滤规则-filter f_name { ... };"
再然后是 "消息链-log { source(s_name); filter(f_name); destination(d_name) };"
最后是  "目标动作-destination d_name { ... };"
这样以来一条日志就根据你的意思来处理了,需要注意的是一条日志消息过了之后,会匹配定义的所有配置,并不是匹配到以后就不再往下匹配了
```

#### 注意事项

## **环境说明**

#### 准备工作

- CentOS 7

## **ICMP 协议介绍**

- ICMP 数据包由 8bit 的错误类型和 8bit 的代码和 16bit 的校验和组成。而前 16bit 就组成了 ICMP 所要传递的信息。
- 常用报文类型如下：

  | Type | Code | Description                                                                      | Query | Error |
  | ---- | ---- | -------------------------------------------------------------------------------- | ----- | ----- |
  | 0    | 0    | Echo Reply——回显应答（Ping 应答）                                                | ×     |       |
  | 3    | 0    | Network Unreachable——网络不可达                                                  |       | ×     |
  | 3    | 1    | Host Unreachable——主机不可达                                                     |       | ×     |
  | 3    | 2    | Protocol Unreachable——协议不可达                                                 |       | ×     |
  | 3    | 3    | Port Unreachable——端口不可达                                                     |       | ×     |
  | 3    | 4    | Fragmentation needed but no frag. bit set——需要进行分片但设置不分片比特          |       | ×     |
  | 3    | 5    | Source routing failed——源站选路失败                                              |       | ×     |
  | 3    | 6    | Destination network unknown——目的网络未知                                        |       | ×     |
  | 3    | 7    | Destination host unknown——目的主机未知                                           |       | ×     |
  | 3    | 8    | Source host isolated (obsolete)——源主机被隔离（作废不用）                        |       | ×     |
  | 3    | 9    | Destination network administratively prohibited——目的网络被强制禁止              |       | ×     |
  | 3    | 10   | Destination host administratively prohibited——目的主机被强制禁止                 |       | ×     |
  | 3    | 11   | Network unreachable for TOS——由于服务类型 TOS，网络不可达                        |       | ×     |
  | 3    | 12   | Host unreachable for TOS——由于服务类型 TOS，主机不可达                           |       | ×     |
  | 3    | 13   | Communication administratively prohibited by filtering——由于过滤，通信被强制禁止 |       | ×     |
  | 3    | 14   | Host precedence violation——主机越权                                              |       | ×     |
  | 3    | 15   | Precedence cutoff in effect——优先中止生效                                        |       | ×     |
  | 4    | 0    | Source quench——源端被关闭（基本流控制）                                          |       |       |
  | 5    | 0    | Redirect for network——对网络重定向                                               |       |       |
  | 5    | 1    | Redirect for host——对主机重定向                                                  |       |       |
  | 5    | 2    | Redirect for TOS and network——对服务类型和网络重定向                             |       |       |
  | 5    | 3    | Redirect for TOS and host——对服务类型和主机重定向                                |       |       |
  | 8    | 0    | Echo request——回显请求（Ping 请求）                                              |       | ×     |
  | 9    | 0    | Router advertisement——路由器通告                                                 |       |       |
  | 10   | 0    | Route solicitation——路由器请求                                                   |       |       |
  | 11   | 0    | TTL equals 0 during transit——传输期间生存时间为 0                                |       | ×     |
  | 11   | 1    | TTL equals 0 during reassembly——在数据报组装期间生存时间为 0                     |       | ×     |
  | 12   | 0    | IP header bad (catchall error)——坏的 IP 首部（包括各种差错）                     |       | ×     |
  | 12   | 1    | Required options missing——缺少必需的选项                                         |       | ×     |
  | 13   | 0    | Timestamp request (obsolete)——时间戳请求（作废不用）                             |       | ×     |
  | 14   |      | Timestamp reply (obsolete)——时间戳应答（作废不用）                               |       | ×     |
  | 15   | 0    | Information request (obsolete)——信息请求（作废不用）                             |       | ×     |
  | 16   | 0    | Information reply (obsolete)——信息应答（作废不用）                               |       | ×     |
  | 17   | 0    | Address mask request——地址掩码请求                                               |       | ×     |
  | 18   | 0    | Address mask reply——地址掩码应答                                                 |       |       |

* ICMP 报文可分为两大类：
  一、有关信息采集和配置的 ICMP 报文(称为查询（query）或者信息类报文(information message))
  查询报文有以下几种用途:
  ping 查询（不要告诉我你不知道 ping 程序）
  子网掩码查询（用于无盘工作站在初始化自身的时候初始化子网掩码）
  时间戳查询（可以用来同步时间）
  二、有关 IP 数据报传递的 ICMP 报文（称为差错报文（error message））.
  产生在数据传送发生错误的时候。

**1. ping**

- ping 这个单词源自声纳定位，而这个程序的作用也确实如此，它利用 ICMP 协议包来侦测另一个主机是否可达。原理是用类型码为 0 的 ICMP 发请求，受到请求的主机则用类型码为 8 的 ICMP 回应。ping 程序来计算间隔时间，并计算有多少个包被送达。用户就可以判断网络大致的情况。我们可以看到， ping 给出来了传送的时间和 TTL 的数据。我给的例子不太好，因为走的路由少，有兴趣地可以 ping 一下国外的网站比如 sf.net，就可以观察到一些 丢包的现象，而程序运行的时间也会更加的长。
  ping 还给我们一个看主机到目的主机的路由的机会。这是因为，ICMP 的 ping 请求数据报在每经过一个路由器的时候，路由器都会把自己的 ip 放到该数据报中。而目的主机则会把这个 ip 列表复制到回应 icmp 数据包中发回给主机。但是，无论如何，ip 头所能纪录的路由列表是非常的有限。如果要观察路由， 我们还是需要使用更好的工具，就是要讲到的 Traceroute(windows 下面的名字叫做 tracert 命令)。

**2. Traceroute**

- Traceroute 是用来侦测主机到目的主机之间所经路由情况的重要工具，也是最便利的工具。前面说到，尽管 ping 工具也可以进行侦测，但是，因为 ip 头的限制，ping 不能完全的记录下所经过的路由器。所以 Traceroute 正好就填补了这个缺憾。
  Traceroute 的原理是非常非常的有意思，它受到目的主机的 IP 后，首先给目的主机发送一个 TTL=1（还记得 TTL 是什么吗？）的 UDP(后面就知道 UDP 是什么了)数据包，而经过的第一个路由器收到这个数据包以后，就自动把 TTL 减 1，而 TTL 变为 0 以后，路由器就把这个包给抛弃了，并同时产生 一个主机不可达的 ICMP 数据报给主机。主机收到这个数据报以后再发一个 TTL=2 的 UDP 数据报给目的主机，然后刺激第二个路由器给主机发 ICMP 数据报。如此往复直到到达目的主机这样，traceroute 就拿到了所有的路由器 ip。从而避开了 ip 头只能记录有限路由 IP 的问题。
  有人要问，我怎么知道 UDP 到没到达目的主机呢？这就涉及一个技巧的问题，TCP 和 UDP 协议有一个端口号定义，而普通的网络程序只监控少数的几个号码较小的端口，比如说 80,比如说 23,等等。而 traceroute 发送的是端口号>30000 的 UDP 报，所以到达目的主机的时候，目的主机只能发送一个端口不可达的 ICMP 数据报给主机。主机接到这个报告以后就知道主机了。
  Traceroute 程序里面提供了一些很有用的选项，甚至包含了 IP 选路的选项，请察看 man 文档来了解这些，这里就不赘述了。

## **注意事项**

**在特殊情况下，是不产生 ICMP 错误报文的。如下：**

- ICMP 差错报文不会产生 ICMP 差错报文（出 IMCP 查询报文）（防止 IMCP 的无限产生和传送）
- 目的地址是广播地址或多播地址的 IP 数据报。
- 作为链路层广播的数据报。
- 不是 IP 分片的第一片。
- 源地址不是单个主机的数据报。这就是说，源地址不能为零地址、环回地址、广播地址或多播地址。

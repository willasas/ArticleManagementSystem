## **环境说明**

#### 准备工作

- CentOS 7

## **数据链路层目的**

- 为 IP 模块发送和接收 IP 数据报
- 为 ARP 模块发送 ARP 请求和接收 ARP 应答（ARP：地址解析协议，是用 IP 地址换 MAC 地址的一种协议）
- 为 RARP 发送 RARP 请求和接收 RARP 应答（RARP：逆地址解析协议）

**1. 其他数据链路层协议**

- 以太网协议，令牌环，FDDI，PPP 协议（就是 adsl 宽带），loopback 协议。

**2. 在 linux 中执行 ifconfig -a 命令，这个命令通常会得到如下的结果**

```@Terminal
ifconfig -a
ens33: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.174.141  netmask 255.255.255.0  broadcast 192.168.174.255
        inet6 fe80::201f:5ad0:be74:f824  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:1a:99:b5  txqueuelen 1000  (Ethernet)
        RX packets 41  bytes 12975 (12.6 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 71  bytes 9035 (8.8 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 84  bytes 9156 (8.9 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 84  bytes 9156 (8.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

virbr0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.122.1  netmask 255.255.255.0  broadcast 192.168.122.255
        ether 52:54:00:ed:64:b5  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

virbr0-nic: flags=4098<BROADCAST,MULTICAST>  mtu 1500
        ether 52:54:00:ed:64:b5  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

- 其中，ens33 就是以太网接口，而 loop 则是 loopback 接口。这也说明这个主机在网络链路层上至少支持 loopback 协议和以太网协议。

**3. 以太网的定义**

- 指数字设备公司（ Digital Equipment Corp.）、英特尔公司（Intel Corp.）和 Xerox 公司在 1982 年联合公布的一个标准，这个标准里面使用了一种称作 CSMA/CD 的接入方法。而 IEEE802 提供的标准集 802.3(还有一部分定义到了 802.2 中)也提供了一个 CSMA/CD 的标准。

- 以太网的 IP 数据报封装在 RFC894 中定义，而 IEEE802 网络的 IP 数据报封装在 RFC1042 中定义。
- 一台主机一定要能发送和接收 RFC894 定义的数据报。
- 一台主机可以接收 RFC894 和 RFC1042 的封装格式的混合数据报。
- 一台主机也许能够发送 RFC1042 数据报。如果主机能同时发送两种类型的分组数据，那么发送的分组必须是可以设置的，而且默认条件下必须是 RFC 894 分组。

**4. PPP 协议**

- ppp(点对点协议)是从 SLIP 的替代品。他们都提供了一种低速接入的解决方案。而每一种数据链路层协议，都有一个 MTU（最大传输单元）定义，在这个定义下面，如果 IP 数据报过大，则要进行分片(fragmentation)，使得每片都小于 MTU，注意 PPP 的 MTU 并不是一个物理定义，而是指一个逻辑定义（个人认为就是用程序控制）。可以用 netstat 来打印出 MTU 的结果，比如键入 netstat -in

```@Terminal
netstat -in
Kernel Interface table
Iface             MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
ens33            1500   165942      0      0 0         70217      0      0      0 BMRU
lo              65536       84      0      0 0            84      0      0      0 LRU
virbr0           1500        0      0      0 0             0      0      0      0 BMU
```

- SMTP 协议非常简单，简单到允许任何用户发送邮件同时也允许发送到任何用户。在发件人（MAIL FROM）哪里可以随意指定地址。但是收件人（RCPT TO）可以发给本域内用户也可以通过中继发送给其他域用户。如 163 或 QQ 邮箱。但是一般公网邮箱都是需要进行发件人域名反向解析，如果能解析就接收邮件，不能解析就丢失邮件。如果全部解析就有点太苛刻了，也可以针对部分域名进行解析。

**5. loopback(环回接口)**

- 平时我们用 127.0.0.1 来尝试自己的机器服务器好使不好使。走的就是这个 loopback 接口。对于环回接口，有如下三点值得注意:
- 传给环回地址（一般是 127.0.0.1）的任何数据均作为 IP 输入。
- 传给广播地址或多播地址的数据报复制一份传给环回接口，然后送到以太网上。这是因为广播传送和多播传送的定义包含主机本身。
- 任何传给该主机 IP 地址的数据均送到环回接口。

## **注意事项**

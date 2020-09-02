## **环境说明**

#### 准备工作

- Ubuntu 16.04.5 LTS
- OpenSSL 实现私有 CA

## **步骤说明**

**1. CA 服务器生成一对秘钥并保存**

```@Terminal
openssl genrsa 1024 > /etc/pki/CA/private/cakey.pem
```

**2. CA 服务器生成自签署证书**

```@Terminal
req -new -x509 -key /etc/pki/CA/private/cakey.pem -out /etc/pki/CA/cacert.pem -days 365
输入国家名称2位的代码：cn
输入所在省份的名称：shanghai
输入所在城市的名称：shanghai
输入公司的名称：ywnds
输入所在的部门：tech
输入主机的名称：ca.ywnds.com(此主机名要跟服务器的主机名保持一致；客户端访问主机时必须要通过这个主机名才能建立连接否则说证书不可信)
输入E-mail：admin@ywnds.com
```

**3. 为 CA 创建一些目录和文件**

```@Terminal
mkdir /etc/pki/CA/{certs,newcerts,crl}
touch /etc/pki/CA/{index.txt,serial}
echo 01 > /etc/pki/CA/serial
```

**4. 邮件服务器生成证书**

```@Terminal
mkdir /etc/dovecot/ssl
openssl genrsa -out /etc/dovecot/ssl/dovecot.key 1024
opensslreq -new -key /etc/dovecot/ssl/dovecot.key -out /etc/dovecot/ssl/dovecot.csr
[输入的信息一定要跟CA输入的信息一致因为我们创建的私有CA]
输入国家名称2位的代码：cn
输入所在省份的名称：shanghai
输入所在城市的名称：shanghai
输入公司的名称：ywnds
输入所在的部门：tech
输入主机的名称：mail.ywnds.com(此主机名要跟服务器的主机名保持一致；客户端访问主机时必须要通过这个主机名才能建立连接否则说证书不可信)
输入E-mail：admin@ywnds.com
证书密码：
```

**5. 在 CA 服务器签署证书并发送回给邮件服务器**

```@Terminal
openssl ca -in /etc/dovecot/ssl/dovecot.csr -out /etc/dovecot/ssl/dovecot.crt -days 365
```

**6. 在 CA 服务器上查看签署过后/etc/pki/CA 下的文件发生的变化**

```@Terminal
cat /etc/pki/CA/index.txt
cat /etc/pki/CA/serial
```

**7. Dovecot 开启 SSL**

```@Terminal
vim /etc/dovecot.conf
protocols pop pop3 imap imap4

[root@localhost ~]# vim /etc/dovecot/conf.d/10-ssl.conf
ssl = yes
ssl_cert = /etc/dovecot/ssl/dovecot.crt
ssl_key = /etc/dovecot/ssl/dovecot.key

[root@localhost ~]# service dovecot restart
```

## **注意事项**

**MUA 连接邮件服务器注意事项**

- 1.把 CA 的证书 cacert.pem 下载到客户端改名 cacert.crt 并安装到根信任域。
- 2.客户端连接 pop3s 服务器时 POP3s 会发来证书，此时 CA 证书 cacert.crt 会去验证 POP3 证书，没有问题就可以传输邮件。
- 3.MUA 在连接 POP3s 服务器时要使用域名不能使用 IP 地址，因为要跟证书中的主机名对应，不然还是会不受信任，同时客户端要能解析此域名。

## **环境说明**

#### 准备工作

- Ubuntu 16.04.5 LTS
- Maildrop

## **Postfix 使用 maildrop 投递邮件**

- Maildrop 是本地邮件投递代理（MDA）, 支持过滤(/etc/maildroprc)、投递和磁盘限额(Quota)功能。
  Maildrop 是一个使用 C++编写的用来代替本地 MDA 的带有过滤功能邮件投递代理，是 courier 邮件系统组件之一。它从标准输入接受信息并投递到用户邮箱；maildrop 既可以将邮件投递到 mailboxes 格式邮箱，亦可以将其投递到 maildirs 格式邮箱。同时，maildrop 可以从文件中读取入站邮件过滤指示，并由此决定是将邮件送入用户邮箱或者转发到其它地址等。和 procmail 不同的是，maildrop 使用结构化的过滤语言，因此，邮件系统管理员可以开发自己的过滤规则并应用其中。

- 使用 maildrop 来代替 postfix 自带的 MDA，并以此为基础扩展后文的邮件杀毒和反垃圾邮件功能的调用。Maildrop 如果以 RPM 包安装会自动创建 vuser 用户及 vgroup 用户组，专门用于邮件的存储；使用源码安装则需要手动创建用户和用户组，且 ID 大于 1000，即上文创建的用户 vmail(1001)和组 vmail(1001)。

## **步骤说明**

**1. 依赖 courier-authlib 的头和库文件**

- 将 courier-authlib 的头文件及库文件链接至/usr 目录(编译 maildrop 时会到此目录下找此些相关的文件)

```@Terminal
ln -sv /usr/local/courier-authlib/bin/courierauthconfig /usr/bin
ln -sv /usr/local/courier-authlib/include/* /usr/include/
echo "/usr/local/courier-authlib/lib/courier-authlib" >> /etc/ld.so.conf.d/courier-authlib.conf
ldconfig -v
```

**2. 解决需要依赖的 pcre 头文件和库文件**

- maildrop 需要 pcre 的支持，因此，需要事先提供 pcre 的头文件及库文件等开发组件，如果选择以 yum 源来提供 pcre，请确保安装 pcre-devel 包

```@Terminal
yum install pcre-devel
```

**3. 安装 courier-unicode**

- 字符集库文件，相当 于 RPM 方式安装的 courier-authlib-devel 包，不安装这个会导致编译 maildrop 时报错

```@Terminal
tar xvf courier-unicode-1.1.tar.bz2
cd courier-unicode-1.1
./configure
make && make install
```

**4. 安装 maildrop**

```@Terminal
tar xvf maildrop-2.7.2.tar.bz2
cd maildrop-2.7.2
./configure \
--enable-sendmail=/usr/sbin/sendmail \
--enable-syslog=1 \
--enable-maildirquota \
--enable-maildrop-uid=1001 \
--enable-maildrop-gid=1001 \
--with-trashquota \
--with-dirsync
make
make install
```

- 检查安装结果，请确保有“Courier Authentication Library extension enabled.”一句出现

```@Terminal
maildrop -v
```

**5. 创建配置文件/etc/maildroprc**

```@Terminal
vim /etc/maildroprc
touch /var/log/maildrop.log
chown vmail.vmail /var/log/maildrop.log
```

**6. 配置 Postfix 的 master.cf 文件**

```@Terminal
vim /etc/postfix/master.cf
#maildrop  unix  -       n       n       -       -       pipe
#  flags=DRhu user=vmail argv=/usr/local/bin/maildrop -d ${recipient}
```

- 注意：启用如上两行，定义 transport 的时候，即如上两行中的第二行其参数行必须以空格开头否则会出错

**7. 重启服务**

```@Terminal
service postfix restart
service courier-authlib restart
service httpd restart
```

**8. 测试**

- 可以进行发信测试，如果日志中的记录类同以下项 maildrop 投递，则安装成功

```
Apr 15 15:33:54 localhost postfix/pipe[11964]: 04B92147CE9: to=, relay=maildrop, delay=0.16, delays=0.07/0.03/0/0.07, dsn=2.0.0, status=sent (delivered via maildrop service)
```

## **注意事项**

- 如果想使用 maildrop 来进行邮件过滤只需要在/etc/maildroprc 中使用 maildrop 基于域的过滤条件即可。

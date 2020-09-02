## **环境说明**

#### 准备工作

- Ubuntu 16.04.5 LTS
- YUM 配置
- 编译环境配置

## **步骤说明**

**1. 卸载系统自带的 Postfix**

```@Terminal
rpm -q postfix
rpm -ev postfix --nodeps
```

**2. 安装 MySQL 服务器**

```@Terminal
yum install mysql-server mysql mysql-devel perl-DBD-MySQL
chkconfig mysqld on
service mysqld restart
rpm -q mysql
```

**3. 安装 cyrus-sasl 并启动 saslauthd 服务**

```@Terminal
yum install cyrus-sasl cyrus-sasl-devel
service saslauthd start
chkconfig saslauthd on
```

**4. 查看 postfix 用户**

```@Terminal
$ id postfix
uid=89(postfix) gid=89(postfix) 组=89(postfix),12(mail)
```

- 发送邮件的用户，这里就使用系统自带的 postfix 用户，记住 UID:89、GID:89，后面很多地方都要用到这两个 ID 号，如果此 ID 号更改了，那么 Postfix 安装方面会有很多目录权限都需要更改。

**5. 编译安装 postfix-2.11.7**

```@Terminal
tar zxvf postfix-2.11.7.tar.gz
cd postfix-2.11.7
make makefiles 'CCARGS=-DHAS_MYSQL -I/usr/include/mysql -DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I/usr/include/sasl  -DUSE_TLS ' 'AUXLIBS=-L/usr/lib64/mysql -lmysqlclient -lz -lm -L/usr/lib/sasl2 -lsasl2  -lssl -lcrypto'
tar zxvf postfix-2.11.7.tar.gz
cd postfix-2.11.7
make makefiles 'CCARGS=-DHAS_MYSQL -I/usr/include/mysql -DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I/usr/include/sasl  -DUSE_TLS ' 'AUXLIBS=-L/usr/lib64/mysql -lmysqlclient -lz -lm -L/usr/lib/sasl2 -lsasl2  -lssl -lcrypto'

#-DHAS_MYSQL -I/usr/include/mysql   //启用Mysql存储，指定头文件;
#-DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I/usr/include/sasl   //启用SASL（cyrus）认证框架;
#-DUSE_TLS    //启用SSL功能;
#AUXLIBS=-L/usr/lib64/mysql -lmysqlclient    //找Mysql客户端库文件;
#-lz                    //压缩裤文件;
#-lm -L/usr/lib64/sasl2     //模块文件;
#-lsasl2 -lssl -lcrypto       //加密库文件;
```

- 结果如下，则表示配置成功

```@Terminal
[src/posttls-finger]
cat ../../conf/makedefs.out Makefile.in >Makefile
rm -f Makefile; (cat conf/makedefs.out Makefile.in) >Makefile
$ make
$ make install
```

- 按照以下的提示输入相关的路径([ ]号中的是缺省值，”]”后的是输入值，省略的表示采用默认值)

```@Terminal
install_root: [/]
#指定Postfix安装目录，默认
tempdir: [/root/postfix-2.11.7] /tmp/postfix
#指定Postfix临时文件目录
config_directory: [/etc/postfix]
#指定Postfix配置文件目录，默认
command_directory: [/usr/sbin]
#指定Postfix二进制文件目录，默认
daemon_directory: [/usr/libexec/postfix]
#指定Postfix服务器进程，默认
data_directory: [/var/lib/postfix]
#指定Postfix可写文件目录，默认
html_directory: [no] /var/www/html/postfix
#指定Postfix帮助文件，可以使用web服务器打开
mail_owner: [postfix]
#指定Postfix属主，默认
mailq_path: [/usr/bin/mailq]
#指定Postfix队列程序路径，默认
manpage_directory: [/usr/local/man]
newaliases_path: [/usr/bin/newaliases]
#指定Postfix生成别名命令位置，默认
queue_directory: [/var/spool/postfix]
#指定Postfix队列目录，默认
readme_directory: [no]
sendmail_path: [/usr/sbin/sendmail]
#指定Postfix客户端（smtp），默认
setgid_group: [postdrop]
#指定Postfix投递组（默认有这个组，但没有这个用户），默认
PS：如果输入错误可以按Ctrl+退格键删除字符。
```

**6. 添加 SysV 风格服务脚本**

```@Terminal
vim /etc/rc.d/init.d/postfix
#!/bin/bash
#
# chkconfig: 2345 80 30
# description: Postfix is a Mail Transport Agent, which is the program \
# processname: master
# pidfile: /var/spool/postfix/pid/master.pid
# config: /etc/postfix/main.cf
# config: /etc/postfix/master.cf
# Source function library.
. /etc/rc.d/init.d/functions
# Source networking configuration.
. /etc/sysconfig/network

# Check that networking is up.
[ $NETWORKING = "no" ] && exit 3

[ -x /usr/sbin/postfix ] || exit 4
[ -d /etc/postfix ] || exit 5
[ -d /var/spool/postfix ] || exit 6

RETVAL=0
prog="postfix"

start() {
      # Start daemons.
      echo -n $"Starting postfix: "
        /usr/bin/newaliases >/dev/null 2>&1
      /usr/sbin/postfix start 2>/dev/null 1>&2 && success || failure $"$prog start"
      RETVAL=$?
      [ $RETVAL -eq 0 ] && touch /var/lock/subsys/postfix
        echo
      return $RETVAL
}
stop() {
        # Stop daemons.
      echo -n $"Shutting down postfix: "
      /usr/sbin/postfix stop 2>/dev/null 1>&2 && success || failure $"$prog stop"
      RETVAL=$?
      [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/postfix
      echo
      return $RETVAL
}
reload() {
      echo -n $"Reloading postfix: "
      /usr/sbin/postfix reload 2>/dev/null 1>&2 && success || failure $"$prog reload"
      RETVAL=$?
      echo
      return $RETVAL
}
abort() {
      /usr/sbin/postfix abort 2>/dev/null 1>&2 && success || failure $"$prog abort"
      return $?
}
flush() {
      /usr/sbin/postfix flush 2>/dev/null 1>&2 && success || failure $"$prog flush"
      return $?
}
check() {
      /usr/sbin/postfix check 2>/dev/null 1>&2 && success || failure $"$prog check"
      return $?
}

restart() {
      stop
      start
}
# See how we were called.
case "$1" in
  start)
      start
       ;;
  stop)
      stop
      ;;
  restart)
      stop
      start
      ;;
  reload)
      reload
      ;;
  abort)
      abort
      ;;
  flush)
      flush
      ;;
  check)
      check
      ;;
  status)
      status master
      ;;
  condrestart)
      [ -f /var/lock/subsys/postfix ] && restart || :
      ;;
  *)
      echo $"Usage: $0 {start|stop|restart|reload|abort|flush|check|status|condrestart}"
      exit 1
esac
exit $?
# END
[root@localhost ~]# chmod +x /etc/rc.d/init.d/postfix
[root@localhost ~]# chkconfig --add postfix
[root@localhost ~]# chkconfig postfix on
[root@localhost ~]# service postfix start
```

- Postfix 相关命令

```@Terminal
# 开启postfix;
$ postfix start

# 检查配置;
$ postfix check

# 重新加载;
$ postfix reload

$ postconf [OPTION]
-d：显示Postfix默认的配置;
-n：显示新修改的配置;
-m：显示支持的存储文件类型如hash,mysql等;
-a：显示支持sasl的客户端插件类型;
```

**7. 安装完毕**

- 如果上面没有使用 UID 为 89 的 postfix 用户，那么检查 postfix 时就会报如下错误

```@Terminal
postfix check
postsuper: fatal: scan_dir_push: open directory defer: Permission denied
```

- 原因是一般编译安装时，Postfix 队列目录/var/spoole/postfix/，下有几个目录会使用系统自带 postfix 的目录，由于系统默认使用 postfix(UID:89)用户给删除了，所以这些目录就找不到 postfix 用户，开启时就会报错一些权限问题，把以下几个目录权限给修改以下就好了，如果还有一些别的目录一并修改即可。

```@Terminal
chown -R postfix.root /var/spool/postfix/defer/
chown -R postfix.root /var/spool/postfix/deferred/
chown -R postfix.root /var/spool/postfix/private/
chown -R postfix.postdrop /var/spool/postfix/public/
chown -R postfix.postdrop /var/spool/postfix/maildrop/
chown -R postfix.root /var/lib/postfix/
```

## **注意事项**

**Postfix 进程**

- master：这条进程是 Postfix 邮件系统的大脑，它产生所有其他进程。
- smtpd：作为服务器端程序处理所有外部连进来的请求。
- smtp：作为客户端程序处理所有对外发起连接的请求。
- qmgr：它是 Postfix 邮件系统的心脏，处理和控制邮件队列里面的所有消息。
- local：这是 Postfix 自有的本地投递代理 MDA，就是它负责把邮件保存到邮箱里。

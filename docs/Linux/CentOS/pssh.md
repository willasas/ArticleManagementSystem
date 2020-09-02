## **环境说明**

#### 准备工作

- CentOS 7
- Python 3.7

## **步骤说明**

**1. 下载 pssh 安装包**

```@Terminal
wget https://files.pythonhosted.org/packages/60/9a/8035af3a7d3d1617ae2c7c174efa4f154e5bf9c24b36b623413b38be8e4a/pssh-2.3.1.tar.gz
```

**2. 安装依赖包**

```@Terminal
yum install -y make gcc gcc++ python-devel python-pip
```

**3. 安装 pssh**

```@Terminal
tar xf pssh-2.3.1.tar.gz
cd pssh-2.3.1
python setup.py install
```

**4. 配置免密登录**

```@Terminal
ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:3antaxjGw+hdgfSlrXLYhUe5vgHe9b0ehh/gUY9E8Eg root@localhost.localdomain
The key's randomart image is:
+---[RSA 2048]----+
|            E... |
|          .. ++  |
|         . o.*oo |
|         ...*o*.o|
|        S+.+o@..+|
|        . OoB B o|
|       . o.B.o *.|
|        . o.. +.o|
|           .o..o |
+----[SHA256]-----+
[root@localhost ~]# cd /root/.ssh/
[root@localhost .ssh]# ls
id_rsa  id_rsa.pub
[root@localhost .ssh]# ssh-copy-id 172.16.1.112
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/root/.ssh/id_rsa.pub"
The authenticity of host '172.16.1.112 (172.16.1.112)' can't be established.
ECDSA key fingerprint is SHA256:yFvaxR1x5YDhhe+6xR/Ou6Sm+YPYvPAoiLVKt9mAnXA.
ECDSA key fingerprint is MD5:0d:c4:79:bc:36:7a:a4:82:95:4f:d5:d0:a3:c8:7d:2e.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@172.16.1.112's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh '172.16.1.112'"
and check to make sure that only the key(s) you wanted were added.
[root@localhost .ssh]# ssh-copy-id 172.16.1.16
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/root/.ssh/id_rsa.pub"
The authenticity of host '172.16.1.16 (172.16.1.16)' can't be established.
ECDSA key fingerprint is SHA256:ANzlXzrGA87YLI2vzkPJ/iNPiSQ5JStJc95948jE8aw.
ECDSA key fingerprint is MD5:f9:f1:1b:5a:99:64:d8:d8:e9:9b:e6:bb:c3:d5:bd:e7.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@172.16.1.16's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh '172.16.1.16'"
and check to make sure that only the key(s) you wanted were added.
```

**3. 测试免密登录**

```@Terminal
ssh 172.16.1.112
ssh 172.16.1.16
```

**3. 测试 pssh**

- 创建 aaa 文件存放 ip 地址

```@Terminal
cat aaa
```

- 批量执行 date 命令

```@Terminal
pssh -h aaa -l root -P "date"
```

- 查看磁盘

```@Terminal
pssh -h aaa -l root -P "lsblk"
```

#### 注意事项

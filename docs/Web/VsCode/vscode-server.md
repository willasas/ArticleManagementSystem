## **环境说明**

#### 准备工作

- Linux 服务器（centOS 系统）
- [code-server 下载](https://github.com/cdr/code-server)

## **步骤说明**

**1.下载安装包并安装**

- Fedora, CentOS, RHEL, SUSE

```Terminal
curl -fOL https://github.com/cdr/code-server/releases/download/v3.4.1/code-server-3.4.1-amd64.rpm
sudo rpm -i code-server-3.4.1-amd64.rpm
systemctl --user enable --now code-server
# Now visit http://127.0.0.1:8080. Your password is in ~/.config/code-server/config.yaml
```

- Debian, Ubuntu

```Terminal
curl -fOL https://github.com/cdr/code-server/releases/download/v3.4.1/code-server_3.4.1_amd64.deb
sudo dpkg -i code-server_3.4.1_amd64.deb
systemctl --user enable --now code-server
# Now visit http://127.0.0.1:8080. Your password is in ~/.config/code-server/config.yaml
```

**2. 其他设置**

- SSH 转发

```Terminal
# 在code-server中将 "auth: password" 替换为 "auth: none"
sed -i.bak 's/auth: password/auth: none/' ~/.config/code-server/config.yaml
# 重启 code-server
systemctl --user restart code-server
```

- 设置密码访问

```Terminal
export PASSWORD="你的密码" && ./code-server --host 0.0.0.0 --port 8080
```

**3. 测试**

- 在浏览器中输入 IP+端口号访问

#### 注意事项

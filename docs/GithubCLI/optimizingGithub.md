## **环境说明**
#### 准备工作

> Github镜像访问地址:
- [cnpmjs](https://github.com.cnpmjs.org)
- [fastgit](https://hub.fastgit.org)

## **Github加速方法**
**1. Github文件加速**

利用 Cloudflare Workers 对 github release 、archive 以及项目文件进行加速，部署无需服务器且自带CDN.

- [gh-proxy-GitHub](https://hunsh.net/archives/23/)
- https://gh.api.99988866.xyz
- https://g.ioiox.com

**2. Github加速下载**

只需要复制当前 GitHub 地址粘贴到输入框中就可以代理加速下载。

- [toolwa](http://toolwa.com/github/)

**3. 加速你的Github**

输入 Github 仓库地址，使用生成的地址进行 git ssh 等操作.
- [zhlh6](https://github.zhlh6.cn)

**4. 谷歌浏览器Github加速插件**

- 在Google扩展商店搜索Github加速下载并安装即可。

**5. GitHub raw 加速**

- GitHub raw 域名并非 github.com 而是 raw.githubusercontent.com，上方的 GitHub 加速如果不能加速这个域名，那么可以使用 Static CDN 提供的反代服务。
将 raw.githubusercontent.com 替换为 raw.staticdn.net 即可加速。
- [GitHub raw](raw.githubusercontent.com)

**6. Github + Jsdelivr**

- jsdelivr 唯一美中不足的就是它不能获取 exe 文件以及 Release 处附加的 exe 和 dmg 文件。

**7. 通过 Gitee 中转 fork 仓库下载**

- 访问 gitee 网站：https://gitee.com/ 并登录，在顶部选择“从 GitHub/GitLab 导入仓库” ，
- 在导入页面中粘贴你的Github仓库地址，点击导入即可：
- 等待导入操作完成，然后在导入的仓库中下载浏览对应的该 GitHub 仓库代码，你也可以点击仓库顶部的“刷新”按钮进行 Github 代码仓库的同步。

**8. 通过修改 HOSTS 文件进行加速**

- 获取 github 的 global.ssl.fastly 地址访问：http://github.global.ssl.fastly.net.ipaddress.com/#ipinfo 获取cdn和ip域名：得到：199.232.69.194 https://github.global.ssl.fastly.net
- 获取github.com地址，访问：https://github.com.ipaddress.com/#ipinfo 获取cdn和ip：得到：140.82.114.4 http://github.com
- 修改 host 文件映射上面查找到的 IP &nbsp;
  1. 修改C:\Windows\System32\drivers\etc\hosts文件的权限，指定可写入：右击->hosts->属性->安全->编辑->点击Users->在Users的权限“写入”后面打勾。然后点击确定。
  2. 右击->hosts->打开方式->选定记事本（或者你喜欢的编辑器）->在末尾处添加以下内容：

```
199.232.69.194 github.global.ssl.fastly.net
140.82.114.4 github.com
```

#### 注意事项

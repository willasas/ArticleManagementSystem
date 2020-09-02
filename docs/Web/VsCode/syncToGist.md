## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- [VS Code](https://code.visualstudio.com/)
- Settings Sync 插件
- Github 账号

## **步骤说明**

- 当在不同办公环境中使用 vs code 进行编辑文件时，为避免重复配置和节约时间，我们就可以配置 Settings Sync 插件,通过这个插件我们可以将当前 vs code 中的配置上传到 Gist，之后再通过 Gist 下载，就可以将所有配置同步到新环境中了。

**1.下载 vs code 一步一步默认安装即可**
![安装完成打开预览图](../../img/w_img/vs1.png)

**2. 在 Github 首页点击头像，选择 Settings 进入设置页面**
![设置](../../img/w_img/vs2.png)

- 2.1 点击左侧侧边栏 Developer settings，进入开发者设置
  ![设置](../../img/w_img/vs3.png)

- 2.2 选择 Personal access tokens，点击右侧 Generate new token
  ![设置](../../img/w_img/vs4.png)

- 2.3 填写 token 名称，在下方勾选 gist
  ![设置](../../img/w_img/vs5.png)

- 2.4 点击下方的 Generate token 按钮生成一个新的 token
  ![设置](../../img/w_img/vs6.png)

- 2.5 将生成的新的 token 保存下来
  ![设置](../../img/w_img/vs7.png)

**3. 配置 vscode 程序**

- 3.1 在 vscode 中安装 Settings Sync 插件，输入 Ctrl+Shift+p 输入 Sync，选择更新/上传配置。
  ![设置](../../img/w_img/vs8.png)

- 3.2 将 github 中生成的 token 输入，点击回车
  ![设置](../../img/w_img/vs9.png)

- 在控制台中自动生成一串 id,之后便可以通过 token 和 id 进行配置同步
  ![设置](../../img/w_img/vs10.png)

- 3.3 输入 Ctrl+Shift+p 输入 Sync，选择下载配置，输入 token 和 id 即可同步下载
  ![设置](../../img/w_img/vs11.png)

**4. 其他配置**

- 可以在配置文件中选择是否自动上传和下载

```
"sync.removeExtensions": true,
      "sync.syncExtensions": true,
      "sync.autoDownload": true,h
      "sync.autoUpload": true,he
      "sync.gist": "改成你的id,即前面生成的id"
```

#### 注意事项

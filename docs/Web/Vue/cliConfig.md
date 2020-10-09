## **环境说明**

#### 准备工作

- node.js version > 8.9
- @vue/cli 4.5.6
- [vue-cli 官网](https://github.com/vuejs/vue-cli)
- [RAP2 接口管理平台官网](http://rap2.taobao.org/)

## **步骤说明**

**1. 安装@vue/cli,使用如下命令均可**

```cmd
npm install -g @vue/cli
npm install -g @vue/cli-init  #安装初始化组件
# OR
yarn global add @vue/cli
```

**2. 检测是否安装成功**

```cmd
vue --version
```

**3. 快速原型开发**

- 安装一个全局的扩展

```shell
npm install -g @vue/cli-service-global
vue init webpack test  # 通过webpack生成项目
```

![生成项目](../../img/w_img/17.png)

- 创建一个项目

```shell
vue create clitest  #创建一个名为clitest的项目
vue ui  #以图形化界面创建和管理项目（可选）
vue add eslint  #在现有的项目中安装插件(eslint)（可选）
```

- 若使用vue create命令配置项选择如下：

```
? Check the features needed for your project: (Press <space> to select, <a> to toggle all, <i> to invert selection)
>(*) Choose Vue version
 (*) Babel
 (*) TypeScript
 ( ) Progressive Web App (PWA) Support
 ( ) Router
 ( ) Vuex
 ( ) CSS Pre-processors             //CSS预处理器
 (*) Linter / Formatter             //格式化工具
 ( ) Unit Testing                   //单元测试
 ( ) E2E Testing                    //E2E测试
? Choose a version of Vue.js that you want to start the project with (Use arrow keys)
  2.x
> 3.x (Preview)
Use class-style component syntax? n
Use Babel alongside TypeScript (required for modern mode, auto-detected polyfills, transpiling JSX)? (Y/n) n
? Pick a linter / formatter config: (Use arrow keys)
> ESLint with error prevention only
  ESLint + Airbnb config
  ESLint + Standard config
  ESLint + Prettier
  TSLint (deprecated)
? Pick additional lint features: (Press <space> to select, <a> to toggle all, <i> to invert selection)
>(*) Lint on save         //保存的时候进行Lint
 ( ) Lint and fix on commit   //需要帮你进行fix（修理），这项我们不进行选择
Where do you prefer placing config for Babel, ESLint, etc.? In dedicated config files
Save this as a preset for future projects? (y/N) n
? Pick the package manager to use when installing dependencies:
> Use Yarn
  Use NPM
```

- 若使用vue ui命令配置项选择如下：

![项目详情](../../img/w_img/cli1.png)
![项目预设](../../img/w_img/cli2.png)
![项目功能](../../img/w_img/cli3.png)
![项目配置](../../img/w_img/cli4.png)
![保存预设](../../img/w_img/cli5.png)

**4. 运行项目，进入到项目文件夹后，运行如下命令：**

```shell
npm run serve
# or
yarn serve
#运行webpack生成的项目
npm run dev
```

- vue3+typescript项目结构如下：

```
|-node_modules       -- 所有的项目依赖包都放在这个目录下
|-public             -- 公共文件夹
---|favicon.ico      -- 网站的显示图标
---|index.html       -- 入口的html文件
|-src                -- 源文件目录，编写的代码基本都在这个目录下
---|assets           -- 放置静态文件的目录，比如logo.pn就放在这里
---|components       -- Vue的组件文件，自定义的组件都会放到这
---|App.vue          -- 根组件，这个在Vue2中也有
---|main.ts          -- 入口文件，因为采用了TypeScript所以是ts结尾
---|shims-vue.d.ts   -- 类文件(也叫定义文件)，因为.vue结尾的文件在ts中不认可，所以要有定义文件
|-.browserslistrc    -- 在不同前端工具之间公用目标浏览器和node版本的配置文件，作用是设置兼容性
|-.eslintrc.js       -- Eslint的配置文件，不用作过多介绍
|-.gitignore         -- 用来配置那些文件不归git管理
|-package.json       -- 命令配置和包管理文件
|-README.md          -- 项目的说明文件，使用markdown语法进行编写
|-tsconfig.json      -- 关于TypoScript的配置文件
|-yarn.lock          -- 使用yarn后自动生成的文件，由Yarn管理，安装yarn包时的重要信息存储到yarn.lock文件中
```

![vue2项目结构](../../img/w_img/18.png)
![项目预览](../../img/w_img/19.png)

- 生成用于生产环境的包

```shell
npm run build
# or
npx vue-cli-service build
# 现代模式，会生成两个版本
npx vue-cli-service build --modern
```

**5. 安装 axios**

```shell
npm install axios --save-dev
```

- 导入 axios,在项目的 main.js 文件中，导入 axios,命令如下：

```main.js
import axios from 'axios'  //引入axios

Vue.prototype.$http = axios   //修改内部的$http为axios
```

- 使用 axios

  - 在需要发送异步请求的位置：this.$http.get("url").then((res)=>{})  this.$http.post("url").then((res)=>{})

## **项目说明**

**1. HTML 和静态资源**

- public/index.html 文件是一个会被 html-webpack-plugin 处理的模板。可以使用 lodash template 语法插入内容：

```html
<%= VALUE %> 用来做不转义插值； <%- VALUE %> 用来做 HTML 转义插值； <%
expression %> 用来描述 JavaScript 流程控制。 # 例如：
<link rel="icon" href="<%= BASE_URL %>favicon.ico" />
```

**2. 处理静态资源**

- 从相对路径导入

  - 当你在 JavaScript、CSS 或 \*.vue 文件中使用相对路径 (必须以 . 开头) 引用一个静态资源时，该资源将会被包含进入 webpack 的依赖图中。

- URL 转换规则:

  - 如果 URL 是一个绝对路径 (例如 /images/foo.png)，它将会被保留不变。
  - 如果 URL 以 . 开头，它会作为一个相对模块请求被解释且基于你的文件系统中的目录结构进行解析。
  - 如果 URL 以 ~ 开头，其后的任何内容都会作为一个模块请求被解析。这意味着你甚至可以引用 Node 模块中的资源：

  ```html
  <img src="~some-npm-package/foo.png" />
  ```

  - 如果 URL 以 @ 开头，它也会作为一个模块请求被解析。它的用处在于 Vue CLI 默认会设置一个指向 <projectRoot>/src 的别名 @。(仅作用于模版中)

- 放置在 public 目录下或通过绝对路径被引用

  - 任何放置在 public 文件夹的静态资源都会被简单的复制，而不经过 webpack。你需要通过绝对路径来引用它们。

**3. CSS 相关**

- 预处理器（Sass/Less/Stylus）安装

```shell
# Sass Install
npm install -D sass-loader sass
# Less Install
npm install -D less-loader less
# Stylus Install
npm install -D stylus-loader stylus
```

- 然后你就可以导入相应的文件类型，或在 \*.vue 文件中这样来使用：

```vue
<style lang="scss">
$color: red;
</style>
```

**4. vue.config.js**

- vue.config.js 是一个可选的配置文件，如果项目的 (和 package.json 同级的) 根目录中存在这个文件，那么它会被 @vue/cli-service 自动加载。你也可以使用 package.json 中的 vue 字段，但是注意这种写法需要你严格遵照 JSON 的格式来写。

## **部署**

**0. 打包后将整个 dist 文件夹拷贝到后端代码的 static 文件夹内，并修改 index.html 中对应的路径**

**1. 云开发（CloudBase）**

- 安装云开发 CloudBase CLI，通过 CloudBase Framework 来一键部署应用

```shell
npm install -g @cloudbase/cli  #全局安装
```

- 一键部署,在项目根目录运行以下命令部署 Vue CLI 创建的应用

```
cloudbase login
cloudbase init --without-template
cloudbase framework:deploy
```

**2. 在 Docker 容器中使用 Nginx 部署你的应用**

- 安装 Docker

- 在项目根目录创建 Dockerfile 文件

```Dockerfile
FROM node:10
COPY ./ /app
WORKDIR /app
RUN npm install && npm run build

FROM nginx
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
```

- 在项目根目录创建 .dockerignore 文件,并设置 .dockerignore 文件能防止 node_modules 和其他中间构建产物被复制到镜像中导致构建问题

```.dockerignore
**/node_modules
**/dist
```

- 在项目根目录创建 nginx.conf 文件

```nginx.conf
user  nginx;
worker_processes  1;
error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;
events {
  worker_connections  1024;
}
http {
  include       /etc/nginx/mime.types;
  default_type  application/octet-stream;
  log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';
  access_log  /var/log/nginx/access.log  main;
  sendfile        on;
  keepalive_timeout  65;
  server {
    listen       80;
    server_name  localhost;
    location / {
      root   /app;
      index  index.html;
      try_files $uri $uri/ /index.html;
    }
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
      root   /usr/share/nginx/html;
    }
  }
}
```

- 构建 Docker 镜像

```shell
docker build . -t my-app
# Sending build context to Docker daemon  884.7kB
# ...
# Successfully built 4b00e5ee82ae
# Successfully tagged my-app:latest
```

- 运行 Docker 镜像

```shell
docker run -d -p 8080:80 my-app
curl localhost:8080
# <!DOCTYPE html><html lang=en>...</html>
```

#### 注意事项

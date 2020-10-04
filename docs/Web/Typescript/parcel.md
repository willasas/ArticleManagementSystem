## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2

## **步骤说明**

**1. 安装 parcel，代码如下**

```terminal
yarn add --dev parcel@next
// or
npm i -g parcel-bundler
```

**2. 修改 package.json 文件,代码如下：**

```json
"scripts": {
    "test": "parcel ./src/index.html"
  },
```

**3. 测试打包,在终端执行如下命令：**

```terminal
yarn test
```

- 在浏览器中打开 http://localhost:1234

#### 注意事项

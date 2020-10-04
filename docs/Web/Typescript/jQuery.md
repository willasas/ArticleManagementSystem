## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2
- [jquery 官网](https://jquery.com/)

## **步骤说明**

**1. 在 index.html 中引入 jQuery 库，代码如下**

```html
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
```

**2. 修改 page.ts 文件,代码如下：**

```ts
const teacher: string = 'wenxing'
console.log(teacher)

$(function () {
	alert('wenxing')
})
```

**3. 解决 jQuery 语法报错问题,在终端执行如下命令：**

```terminal
npm i @types/jquery  // 安装比较慢
```

- 或者在 page.ts 文件最顶部内容加如下代码(推荐)：

```ts
declare var $: any
```

- 方法 3，在 src 目录下新建 jquery.d.ts 文件，内容如下：

#### 注意事项

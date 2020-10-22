## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- [SASS/SCSS 下载](https://sass-lang.com/)
- Node.js环境

## **步骤说明**

**1. 在 Windows 上安装 SCSS,假如你已经安装了node.js,在终端执行如下命令：**

```bash
npm install -g sass  # 全局安装SASS
```

- 安装完成后，在命令行输入如下：

```bash
sacc -v  # 查看版本信息
```

**2. 在 vs code 上安装Live Sass Compiler插件,并在设置中配置如下内容:**

```json
// scss配置信息
"liveSassCompile.settings.formats":[
	// 扩展
	{
			"format": "compact",//可定制的出口CSS样式（expanded，compact，compressed，nested）
			"extensionName": ".min.css",//编译后缀名
			"savePath": null//编译保存的路径
	} 	
],

"liveSassCompile.settings.excludeList": [
	"**/node_modules/**",
	".vscode/**"
],
```

**3. 编译SASS文件**

```terminal
//单文件转换命令
sass input.scss output.css

//单文件监听命令
sass --watch input.scss:output.css

//如果你有很多的sass文件的目录，你也可以告诉sass监听整个目录：
sass --watch app/sass:public/stylesheets

//编译格式(--style表示解析后的css是什么排版格式;)sass内置有四种编译格式:`nested``expanded``compact``compressed`。
sass --watch input.scss:output.css --style compact

//编译添加调试map(--sourcemap:开启sourcemap调试后，会生成一个后缀名为.css.map文件)
sass --watch input.scss:output.css --sourcemap

//选择编译格式并添加调试map
sass --watch input.scss:output.css --style expanded --sourcemap

//开启debug信息
sass --watch input.scss:output.css --debug-info
```

**4. 编译排版例子如下：**

```scss
/*未编译样式*/
.box {
  width: 300px;
  height: 400px;
  &-title {
    height: 30px;
    line-height: 30px;
  }
}
```

- nested 编译排版格式：

```css
/*命令行内容sass style.scss:style.css --style nested*/

/*编译过后样式*/
.box {
  width: 300px;
  height: 400px; }
  .box-title {
    height: 30px;
    line-height: 30px; }
```

- expanded 编译排版格式：

```css
/*命令行内容sass style.scss:style.css --style expanded*/

/*编译过后样式*/
.box {
  width: 300px;
  height: 400px;
}
.box-title {
  height: 30px;
  line-height: 30px;
}
```

- compact 编译排版格式：

```css
/*命令行内容sass style.scss:style.css --style compact*/

/*编译过后样式*/
.box { width: 300px; height: 400px; }
.box-title { height: 30px; line-height: 30px; }
```

- compressed 编译排版格式:

```css
/*命令行内容sass style.scss:style.css --style compressed*/

/*编译过后样式*/
.box{width:300px;height:400px}.box-title{height:30px;line-height:30px}
```
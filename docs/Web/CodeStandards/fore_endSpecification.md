## **前端代码规范总结**

#### 文件/资源命名

**1. 通用规则**

- 使用语义化的文件命名，文件名要能“望文生义”，尽量避免使用拼音；
- 文件名只使用字母 a-z，数字 0-9，连字符 -，下划线 \_ 和句点 .；
- 文件命名以字母开头而不是数字，而以特殊字符开头命名的文件，一般都有特殊的含义与用处；
- 文件名中字母全部采用小写，多个单词用下划线分隔（识别效率较驼峰体高）；
- 如需缩写单词，则应使用约定俗成的缩写形式，如 btn、nav、num、img 等，不能自造单词，以免引起歧义。

**2. 目录命名**

- 参照通用规则
- 要合理将文件分类到不同目录，避免一个目录下存放大量的文件。

**3. HTML 文件命名**

- 参照通用规则

**4. CSS/SCSS/LESS 文件命名**

- 参照通用规则
- 压缩版本的 CSS 文件，文件名后面需加上 .min 后缀

**5. Javascript 文件命名**

- 参照通用规则
- 压缩版本的 JavaScript 文件，文件名后面需加上 .min 后缀。

**6. 图片命名**

- 参照通用规则
- 图标类图片，需在文件名前面加上 ico\_ 前缀。
- 背景类图片，需在文件名前面加上 bg\_ 前缀。
- 雪碧图图片，需在文件名后面加上 \_sprite 后缀。
- Retina 图片，需在文件名后面加上 \_1x 或 \_2x 后缀来标记原图和 2 倍图

#### HTML

**1. 通用规则**

- 尽量遵循 HTML 标准和语义，但是不应该以浪费实用性作为代价；
- 任何时候都要用尽量小的复杂度和尽量少的标签来解决问题；
- 不要使用 HTML5 规范中已经被废弃的标签；
- 使用 label 包裹附加文字的表单输入框(radio、checkbox)；
- 标签名全小写；
- 属性名全小写，用中划线做分隔符；
- 属性值使用双引号，不要使用单引号；
- 不要在自动闭合标签结尾处使用斜线（HTML5 规范指出他们是可忽略的）。

**2. 缩进**

- 缩进使用 1 个 Tab（占 2 个空格宽度）；
- 除 head 和 body 外，嵌套的节点应该缩进；
- 每个块级、列表、表格元素单独占一行，每个子元素都相对父元素缩进；
- 坚决不要使用 Tab 和空格混搭的缩进方式。
- 使用 Tab 缩进比空格缩进有哪些优势？
- 空格缩进一般通过键入 2 或 4 个空格来缩进对齐，其按键成本比 Tab 高得多（有些 IDE 可以设置空格宽度），使用 Tab 缩进更快捷；
- 使用 Shift + Tab 组合键可以选取多行向前缩进，使用空格缩进做不到；
- Tab 可以替换，在支持正则搜索的编辑器里，使用 可以匹配搜索全部 Tab，空格缩进做不到。

**3. 文档头**

- 页面开头必须有文档头声明，推荐使用 HTML5 简单的 doctype 声明来启用标准模式，使页面在每个浏览器中尽可能一致的展现。
- 按照惯例，doctype 应大写。

```html
<!DOCTYPE html>
<html>
	...
</html>
```

**4. 字符编码**

- 在 HTML 中指定字符编码，让浏览器轻松、快速的确定适合网页内容的渲染方式。
  字符编码通常设为 UTF-8 。

```html
<meta charset="UTF-8" />
```

**5. 渲染模式**

- 指定使用本地最高版本的 IE 来渲染页面。
- 对于国内常见的双核浏览器，指定优先采用极速模式（webkit 内核）来渲染页面。（目前仅 360 浏览器支持）

```html
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
```

**6. CSS 和 Javascript 文件引入**

- 无需为引入的 CSS 和 JavaScritp 指明 type 属性（在 HTML5 规范中，text/css 和 text/javascript 分别是他们的默认值，省略后对页面无影响）；
- 通常引入的 CSS 文件放在 head 标签内；
- 一般情况下，JavaScript 脚本应放在页面底部， body 结束标签前面，以免阻塞页面加载，同时也避免了文档加载完成前 JS 无法获取 DOM 元素的问题。

**7. 属性顺序**

- HTML 属性应当按照特定的顺序依次排列，确保代码的易读性和可维护性。
- Class 用于标识高度可复用组件，因此应该排在首位；id 用于标识具体组件，排在第二位。

```@html
class
id
name
data-*
src, for, type, href, value, max-length, max, min, pattern
placeholder, title, alt
aria-*, role
required, readonly, disabled
```

**8. Boolean 属性**

- HTML5 规范中，boolean 属性不需要声明属性值。
- Boolean 属性的存在表示取值为 true，不存在则表示取值为 false。

```html
<input type="text" disabled />
<input type="text" readonly />
<input type="checkbox" checked />
<select>
	<option value="1" selected>1</option>
</select>
<autio src="my_music_name.mp3" controls></autio>
```

#### CSS

**1. 通用规则**

- 代码风格上要以具有可读性、可维护性为基本原则，压缩代码的工作交给工具去做；
- css 文件使用无 BOM 的 UTF-8 编码；
- 不允许有空的规则；
- 元素选择器用小写字母；
- 不要在一个文件里出现两个相同的规则；
- 不允许驼峰命名多个字母用短杠分割
- 每个属性声明末尾都要加分号。

```css
ul > li {
	font-size: 12px;
}
.style {
	color: red;
}
```

**2. 缩进**

- 与 HTML 缩进方式一样，缩进使用 1 个 Tab（占 2 个空格宽度)

**3. 空格**

- 属性值前，即属性名的 : 后加空格；
- 多个规则的分隔符 , 后加空格；
- 选择器 >、+、~ 前后加空格；
- { 前加空格；
- !important 的 ! 前加空格；
- @else 前后加空格；
- 属性值中的 , 后加空格；
- SCSS 中的运算符前后要加空格；
- 每行行末不要有多余的空格。

```css
.style {
	color: red !important;
	background-color: rgba(0, 0, 0, 0.5);
}
.style,
,
box {
	...;
}
.box > .style {
	...;
}
@if ($variable * 2 > 10) {
	...;
} @else {
	...;
}
```

**4. 换行**

- { 后和 } 前要换行，如果只有一条属性则例外，无需换行；
- 每个属性独占一行；
- 多个选择器的分隔符 , 后要换行；
- 相邻的两段样式之间要用一个空行隔开；
- 属性组之间需要有一个空行隔开。属性分组规范请参阅“声明顺序”部分。

```css
.style {
	color: blue;
	background-color: black;
}
.style {
	width: 100px;
}
.container,
.form-box {
	...;
}
```

**5. 引号**

- 最外层统一使用双引号；
- 属性选择器中的属性值要用引号；
- font-family 中含有空格的字体名需要加引号；
- url 的内容要用引号。

```css
.style:before {
	content: '';
	background-image: url('logo.png');
}
li[data-type='single'] {
	font-size: 14px;
	font-family: 'Segoe UI', 'Microsoft Yahei';
}
```

5.1 CSS url 的内容加引号有什么好处？

- 降低内容路径被 XSS 注入攻击的风险；
- 避免一些浏览器兼容问题。

**6. 注释**

- 注释使用 /_ 注释内容 _/；
- SCSS 中单行注释用 // 注释内容，不会输出到编译后的 CSS 中；
- 如果希望将 SCSS 中的注释保留输出（即使在 compressed 输出模式下），则使用 /! 注释内容 /；
- 注释的缩进与下一行代码保持一致；
- / 之后、/ 之前和 // 之后要加一个空格；
- // 写在代码右侧时，其与左侧代码间隔 2 个空格。
- 注： // 注释只用于 SCSS 中。

```css
/* Modal header*/
.modal-header {
	...;
}
/*
 * Modal header
 */
.modal-header {
	...;
}
.modal-header {
	/* 150px - left - right */
	width: 150px;
	&.wide {
		// 宽屏模式
		width: 300px;
	}
}
```

**7. 命名**

- 命名要符合语义，尽量避免使用拼音（约定俗成的除外，例如 youdao）、无意义或理解困难、易产生歧义的字符；
- Class 类名使用小写字母，以"-"分隔；
- 仅当作 JS 中选择器使用的 class 类名，加上 js- 前缀；
- SCSS 中的变量和 placeholder 使用小写字母，"-"分隔；
- id 采用小驼峰式命名；
- SCSS 中的函数、混合采用小驼峰式命名。
  7.1 不建议使用“\_”下划线来命名 CSS 选择器，原因如下：
- 输入的时候少按一个 shift 键；
- 浏览器兼容问题 （比如使用\_tips 的选择器命名，在 IE6 是无效的）
- 能良好区分 JavaScript 变量命名（JS 变量命名是用“\_”）

```css
.btn {
	...;
}
.user-list {
	...;
}
/* class */
.element-content {
	...;
}
/* id */
#myDialog {
	...;
}
/* SCSS 变量 */
$color-black: #000;
/* SCSS placeholder */
%dialog-border {
	...;
}
/* SCSS 函数 */
@function pxToRer($px) {
	...;
}
/* SCSS 混合 */
@mixin centerBlock {
	...;
}
```

**8. 声明顺序**

- 推荐的样式编写顺序依次为：
  Positioning（定位）
  Box model（盒模型）
  Typographic（排版）
  Visual（视觉）
  Misc（杂项）

```css
.declaration-order {
	/* Positioning */
	position: absolute;
	top: 0;
	right: 0;
	botton: 0;
	left: 0;
	z-index: 100;
	/* Box model */
	display: block;
	float: right;
	width: 100px;
	height: 100px;
	/* Typographic */
	font: normal 13px 'Helvetica Neue', sans-serif;
	line-height: 1.5;
	color: #333;
	text-align: center;
	/* Visual */
	background-color: #f5f5f5;
	border-radius: 3px;
	/* Misc */
	opacity: 1;
}
```

**9. 简写和省略**

- 颜色 16 进制用小写字母，可以简写的要简写；
- 根据实际情况选择属性的简写方式；
- 属性值如果是类似 0.x 的小数，则省略小数点前的 0；
- 属性值如果是 0，则省略单位。
- padding, margin, font 等属性尽量使用缩写，提高用户的阅读体验。

```css
.style {
	color: #333;
}
.div {
	padding: 0.5em 1em;
}
.style {
	margin: 0 0 0 10px;
}
.list-box {
	border-top: 0;
	font: 100%/1.6 serif;
	padding: 0 1em 2em;
}
```

**10. 前缀属性**

- 同个属性不同前缀的写法需要在垂直方向保持对齐，具体参照示例的写法；
- 无前缀的标准属性应该写在有前缀的属性后面。
- 如非必要，尽量不要手写前缀属性，推荐使用自动化工具来处理，例如：autoprefixer。

```css
.style {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
```

**11. 书写顺序**

- 位置属性（position, top, right, z-index, display, float 等）
- 大小（width, height, padding, margin）
- 文字系列（font, line-height, letter-spacing, color-text-align 等）
- 背景（background, border 等）
- 其他（animation, transition 等）

```css
.example {
	z-index: -1;
	display: inline-block;
	font-size: 1.5em;
	color: red;
	background-color: #9e0;
}
```

**12. 杂项**

- 如果样式表文件中包含汉字（注释）或其他 Unicode 字符，建议在第一行加上 @UTF-8 字符集声明，避免乱码；
- 后代选择、子选择器不要超过 4 层；
- 慎用 !important；
- 尽量少用 \* 选择器。

#### 注意事项

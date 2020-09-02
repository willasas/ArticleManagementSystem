## **js 性能优化总结**

#### 总结

**1. 不要使用 with()语句**

- 因为 with() 语句将会在作用域链的开始添加额外的变量。额外的变量意味着，当任何变量需要被访问的时候，JavaScript 引擎都需要先扫描 with()语句产生的变量，然后才是局部变量，最后是全局变量。

**2. 对象属性和数组元素**

- 多次引用一个对象属性或者数组元素的时候，可以通过定义一个变量来获得性能提升
- 数值、变量速度显著优于对象属性和数组元素

**3. 避免全局查找**

- 在一个函数中会用到全局对象存储为局部变量来减少全局查找，因为访问局部变量的速度要比访问全局变量的速度更快些

```js
function search() {
	//当我要使用当前页面地址和主机域名
	alert(window.location.href + window.location.host)
}
//最好的方式是如下这样  先用一个简单变量保存起来
function search() {
	var location = window.location
	alert(location.href + location.host)
}
```

**4. 避免 with 语句**

- with 语句会创建自己的作用域，因此会增加其中执行的代码的作用域链的长度，由于额外的作用域链的查找，在 with 语句中执行的代码肯定会比外面执行的代码要慢，在能不使用 with 语句的时候尽量不要使用 with 语句。

```js
with (a.b.c.d) {
	property1 = 1
	property2 = 2
}
//可以替换为：
var obj = a.b.c.d
obj.property1 = 1
obj.property2 = 2
```

**5. 数字转换成字符串**

```
//速度对比
(“” +) > String() > .toString() > new String()
```

**6. 通过模板元素 cloneNode，替代 createElement**

```js
var frag = document.createDocumentFragment()
for (var i = 0; i < 1000; i++) {
	var el = document.createElement('p')
	el.innerHTML = i
	frag.appendChild(el)
}
document.body.appendChild(frag)
//替换为：
var frag = document.createDocumentFragment()
var pEl = document.getElementsByTagName('p')[0]
for (var i = 0; i < 1000; i++) {
	var el = pEl.cloneNode(false)
	el.innerHTML = i
	frag.appendChild(el)
}
document.body.appendChild(frag)
```

**7. 避免低效率的脚本位置**

- 由于脚本会阻塞页面其他资源的下载，因此推荐将所有 script 标签尽可能放到 body 标签的底部，以尽量减少对整个页面下载的影响。

```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Source Example</title>
		<link rel="stylesheet" type="text/css" href="styles.css" />
	</head>
	<body>
		<p>Hello world!</p>
		<!-- Example of efficient script positioning -->
		<script type="text/javascript" src="script1.js"></script>
		<script type="text/javascript" src="script2.js"></script>
		<script type="text/javascript" src="script3.js"></script>
	</body>
</html>
```

**8. 小心使用闭包**

- 根据定义，在它们的作用域链中至少有三个对象：闭包变量、局部变量和全局变量。这些额外的对象将会导致其他的性能问题。

**9. 在循环时将控制条件和控制变量合并起来**

- 使用 while 循环进行轮转来替代某些操作：

```@js
var x = 9;do { } while( x-- );
```

**10. 使用 XMLHttpRequest(XHR)对象**

- 此技术首先创建一个 XHR 对象，然后下载 JavaScript 文件，接着用一个动态的 script 元素将 JavaScript 代码注入页面。
- 此方法最主要的限制是：JavaScript 文件必须与页面放置在同一个域内，不能从 CDN 下载（CDN 指”内容投递网络（Content Delivery Network）”，所以大型网页通常不采用 XHR 脚本注入技术。

**11. 注意 NodeList**

- 最小化访问 NodeList 的次数可以极大的改进脚本的性能
- 何时返回 NodeList 对象：
  1、进行了对 getElementsByTagName()的调用
  2、获取了元素的 childNodes 属性
  3、获取了元素的 attributes 属性
  4、访问了特殊的集合，如 document.forms、document.images 等等

**12. 避免与 null 进行比较**

- 由于 JavaScript 是弱类型的，所以它不会做任何的自动类型检查，所以如果看到与 null 进行比较的代码，尝试使用以下技术替换：
  1、如果值应为一个引用类型，使用 instanceof 操作符检查其构造函数
  2、如果值应为一个基本类型，作用 typeof 检查其类型
  3、如果是希望对象包含某个特定的方法名，则使用 typeof 操作符确保指定名字的方法存在于对象上

**13. 尊重对象的所有权**

- 不要为实例或原型添加属性
- 不要为实例或者原型添加方法
- 不要重定义已经存在的方法
- 不要重复定义其它团队成员已经实现的方法，永远不要修改不是由你所有的对象

  3.1 对象创建新的功能:

- 创建包含所需功能的新对象，并用它与相关对象进行交互
- 创建自定义类型，继承需要进行修改的类型，然后可以为自定义类型添加额外功能

**14. 循环引用**

- 如果循环引用中包含 DOM 对象或者 ActiveX 对象，那么就会发生内存泄露。

  14.1 解决循环引用的方法：

- 置空 dom 对象

```js
function init() {
	var el = document.getElementById('MyElement')
	el.onclick = function () {
		//……
	}
}
init()
//可以替换为：
function init() {
	var el = document.getElementById('MyElement')
	el.onclick = function () {
		//……
	}
	el = null
}
init()
```

- 构造新的 context

```js
function init() {
	var el = document.getElementById('MyElement')
	el.onclick = function () {
		//……
	}
}
init()
//可以替换为：
function elClickHandler() {
	//……
}
function init() {
	var el = document.getElementById('MyElement')
	el.onclick = elClickHandler
}
init()
```

**15. 字符串连接**

- 如果要连接多个字符串，应该少使用+=

```js
s+=a;
s+=b;
s+=c;
//应该写成:
s+=a + b + c；
```

- 收集字符串，比如多次对同一个字符串进行+=操作的话，最好使用一个缓存，使用 JavaScript 数组来收集，最后使用 join 方法连接起来

```js
var buf = []
for (var i = 0; i < 100; i++) {
	buf.push(i.toString())
}
var all = buf.join('')
```

**16. 各种类型转换**

```js
var myVar = '3.14159',
	str = '' + myVar, //  to string
	i_int = ~~myVar, //  to integer
	f_float = 1 * myVar, //  to float
	b_bool = !!myVar /*  to boolean - any string with length and any number except 0 are true */,
	array = [myVar] //  to array
```

**17. 多个类型声明**

- 在 JavaScript 中所有变量都可以使用单个 var 语句来声明，这样就是组合在一起的语句，以减少整个脚本的执行时间

**18. 插入迭代器** \*如 var name=values[i]; i++;前面两条语句可以写成 var name=values[i++]。

**19. 使用直接量**

```js
var aTest = new Array()
//替换为
var aTest = []

var aTest = new Object()
//替换为
var aTest = {}

var reg = new RegExp()
//替换为
var reg = /../

//如果要创建具有一些特性的一般对象，也可以使用字面量，如下：
var oFruit = new O()
oFruit.color = 'red'
oFruit.name = 'apple'
//可改写成这样:
var oFruit = { color: 'red', name: 'apple' }
```

**20. 避免双重解释**

- 尽量少使用 eval 函数
- 不要使用 Function 构造器

```js
var num = 0
setTimeout('num++', 10)
//可以替换为：
var num = 0
function addNum() {
	num++
}
setTimeout(addNum, 10)
```

**21. 缩短否定检测**

```js
if (oTest != '#ff0000') {
  //do something
}
if (oTest != null) {
  //do something
}
if (oTest != false) {
  //do something
}
//虽然这些都正确，但用逻辑非操作符来操作也有同样的效果：
if (!oTest) {//do something}
```

**22. 释放 javascript 对象**

- 对象：obj = null
- 对象属性：delete obj.myproperty
- 数组 item：使用数组的 splice 方法释放数组中不用的 item

**23. ==和===的区别**

- 避免在 if 和 while 语句的条件部分进行赋值，如 if (a = b)，应该写成 if (a == b)，但是在比较是否相等的情况下，最好使用全等运行符，也就是使用===和!==操作符会相对于==和!=会好点。==和!=操作符会进行类型强制转换。

**24. 函数返回统一类型**

- 虽然 JavaScript 是弱类型的，对于函数来说，前面返回整数型数据，后面返回布尔值在编译和运行都可以正常通过，但为了规范和以后维护时容易理解，应保证函数应返回统一的数据类型。

**25. 总是检查数据类型**

- 要检查你的方法输入的所有数据，一方面是为了安全性，另一方面也是为了可用性。用 typeof 方法来检测你的 function 接受的输入是否合法。

**26. 单引号/双引号**

- 建议在 HTML 中使用双引号，在 JavaScript 中使用单引号,定义 JSON 对象时，最好使用双引号。

**27. 部署**

- 用 JSLint 运行 JavaScript 验证器来确保没有语法错误或者是代码没有潜在的问
- 部署之前推荐使用压缩工具将 JS 文件压缩
- 文件编码统一用 UTF-8
- JavaScript 程序应该尽量放在.js 的文件中，需要调用的时候在 script 标签中以 src=”filename.js”的形式包含进来。

**28. 多重判断时使用 Array.includes**

```js
function test(fruit) {
	const redFruits = ['apple', 'strawberry', 'cherry', 'cranberries']

	if (redFruits.includes(fruit)) {
		console.log('red')
	}
}
```

**29. 更少的嵌套，尽早 return**

```js
function test(fruit, quantity) {
	const redFruits = ['apple', 'strawberry', 'cherry', 'cranberries']

	// 条件 1: 尽早抛出错误
	if (!fruit) throw new Error('No fruit!')

	// 条件 2: 必须是红色的
	if (redFruits.includes(fruit)) {
		console.log('red')

		// 条件 3: 必须是大质量的
		if (quantity > 10) {
			console.log('big quantity')
		}
	}
}
```

**30. 使用默认参数和解构**

```js
test({ name: 'apple', color: 'red' }); // apple
function test(fruit) {
  // 获取属性名，如果属性名不可用，赋默认值为 unknown
  console.log(__.get(fruit, 'name', 'unknown');
}

// test results
test(undefined); // unknown
test({ }); // unknown
```

**31. 倾向于遍历对象而不是 Switch 语句**

```js
//使用Map实现根据 color 打印出水果
const fruitColor = new Map()
	.set('red', ['apple', 'strawberry'])
	.set('yellow', ['banana', 'pineapple'])
	.set('purple', ['grape', 'plum'])

function test(color) {
	return fruitColor.get(color) || []
}
//用Array.filter 重构的代码
const fruits = [
	{ name: 'apple', color: 'red' },
	{ name: 'strawberry', color: 'red' },
	{ name: 'banana', color: 'yellow' },
	{ name: 'pineapple', color: 'yellow' },
	{ name: 'grape', color: 'purple' },
	{ name: 'plum', color: 'purple' },
]

function test(color) {
	return fruits.filter((f) => f.color == color)
}
```

**32. 对 所有/部分 判断使用 Array.every & Array.some**

```js
//检查是否所有水果都是红色
const fruits = [
	{ name: 'apple', color: 'red' },
	{ name: 'banana', color: 'yellow' },
	{ name: 'grape', color: 'purple' },
]

function test() {
	// 所有水果都是红色
	const isAllRed = fruits.every((f) => f.color == 'red')
	// 任何一个水果是红色
	const isAnyRed = fruits.some((f) => f.color == 'red')
	console.log(isAllRed) // false
}
```

#### 注意事项

**性能方面的注意事项:**

- 尽量使用原生方法
- switch 语句相对 if 较快
- 位运算较快
- 巧用||和&&布尔运算符
  **避免错误应注意的地方:**
- 每条语句末尾须加分号
- 使用+号时需谨慎
- 使用 return 语句需要注意

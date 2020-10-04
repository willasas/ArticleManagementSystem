## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2
- [require.jsCDN 地址](https://cdnjs.cloudflare.com/ajax/libs/require.js/2.3.6/require.js)

## **步骤说明**

**1. 修改 components.ts 中的内容，写成 ES6 的 export 导出模式，代码如下**

```ts
export class Header {
	constructor() {
		const elem = document.createElement('div')
		elem.innerText = 'This is Header'
		document.body.appendChild(elem)
	}
}

export class Content {
	constructor() {
		const elem = document.createElement('div')
		elem.innerText = 'This is Content'
		document.body.appendChild(elem)
	}
}

export class Footer {
	constructor() {
		const elem = document.createElement('div')
		elem.innerText = 'This is Footer'
		document.body.appendChild(elem)
	}
}
```

**2. 修改 page.ts 文件,使用 import 语法进行导入 Header、Content 和 Footer,代码如下：**

```ts
import { Header, Content, Footer } from './components'
export default class Page {
	constructor() {
		new Header()
		new Content()
		new Footer()
	}
}
```

**3. 引入 require.js 库，并修改 index.html 中的 body 标签的内容如下**

```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.3.6/require.js"></script>
		<script src="./build/page.js"></script>
		<title></title>
	</head>

	<body>
		<!--实例化page-->
		<script>
			require(['page'], function (page) {
				new page.default()
			})
		</script>
	</body>
</html>
```

#### 注意事项

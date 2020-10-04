## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2

## **步骤说明**

**1. 初识接口**

```ts
// 定义Register接口,?:表示可选值
interface Register {
	name: string
	age: number
	height: number
	phone?: number
}

// register对象
const register = {
	name: '小红',
	age: 19,
	height: 170,
	//phone: 18856452265,
}

// Rscreen方法
const Rscreen = (register: Register) => {
	register.age < 40 &&
		register.height >= 160 &&
		console.log(register.name + '进入面试')
	register.age > 40 ||
		(register.height < 155 && console.log(register.name + '你被淘汰'))
}

// getScreen方法
const getScreen = (register: Register) => {
	console.log(register.name + '年龄是：' + register.age)
	console.log(register.name + '身高是：' + register.height)
}

// 调用
Rscreen(register)
getScreen(register)
```

**2. 允许加入任意值**

```ts
// 定义User接口
interface User {
	uname: string
	age: number
	[propname: string]: any
	say(): string
}

// 实现方法
const user = {
	uname: '小红',
	age: 18,
	sex: '女',
	say() {
		return '欢迎'
	},
}
```

#### 注意事项

- 接口只在开发中起作用，编译后的 JavaScript 代码中是不存在接口的

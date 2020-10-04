## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2

## **步骤说明**

**1. 联合类型**

- 联合类型（Union Types）可以通过管道(|)将变量设置多种类型，赋值时可以根据设置的类型来赋值。

```ts
// 申明接口
interface Designer {
	coding: boolean
	design: () => {}
}

// 申明接口
interface Programmer {
	coding: boolean
	write: () => {}
}

// 联合类型，判断谁是Designer谁是Programmer
function judgeWho(animal: Designer | Programmer) {}
```

**2. 类型保护**

- 类型断言

```ts
function judgeWho(animal: Designer | Programmer) {
	if (animal.coding) {
		;(animal as Programmer).write() //coding为True，则为Programmer
	} else {
		;(animal as Designer).design() //否则为Designer
	}
}
```

- in 语法

```ts
function judgeWhoTwo(animal: Designer | Programmer) {
	if ('write' in animal) {
		animal.write() //coding为True，则为Programmer
	} else {
		animal.design() //否则为Designer
	}
}
```

- typeof 语法

```ts
function add(first: string | number, second: string | number) {
	// 判断first和second是不是string类型
	if (typeof first === 'string' || typeof second === 'string') {
		// 时字符串则拼接
		return `${first}${second}`
	}
	return first + second
}
```

- instanceof 语法(只能用在类中)

```ts
class NumberObj {
	count: number
}

function addObj(first: object | NumberObj, second: object | NumberObj) {
	if (first instanceof NumberObj && second instanceof NumberObj) {
		return first.count + second.count
	}
	return 0
}
```

#### 注意事项

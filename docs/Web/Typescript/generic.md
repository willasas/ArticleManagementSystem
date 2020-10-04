## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2

## **步骤说明**

**1. 函数泛型**

- 使用大写 T 来代表泛型
- 泛型支持类型推导(不建议使用)
- 泛型名称可以自定义
- 使用<>指定泛型名称

```ts
// ---------函数泛型--------
function join<T, P>(first: T, second: P) {
	return `${first}${second}`
}
// 调用时必须指定特定的类型
join<string, number>('start', 2)

//-------泛型数组的使用--------
function myFun<T>(params: Array<T>) {
	return params
}
myFun<string>(['123', '456'])
```

**2.类中的泛型**

```ts
// 声明Girl接口
interface Girl {
	name: string
}

// 泛型继承Girl
class SelectGirt<T extends Girl> {
	constructor(private girls: T[]) {}
	//name类型必须与继承中的类型一致
	getGirl(index: number): string {
		return this.girls[index].name
	}
}

const selectGirt = new SelectGirt([
	{ name: 'xiaohong' },
	{ name: 'xiaoxiao' },
	{ name: 'xiaodong' },
])
console.log(selectGirt.getGirl(1))
```

**3. 泛型的约束**

```ts
// 只在number和string类型中选择
class SelectGirt<T extends number | string> {
	constructor(private girls: T[]) {}
	getGirl(index: number): T {
		return this.girls[index]
	}
}

const selectGirt = new SelectGirt<string>(['小红', '小英', '小晓'])
console.log(selectGirt.getGirl(1))
```

#### 注意事项

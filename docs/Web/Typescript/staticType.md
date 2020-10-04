## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2

## **步骤说明**

**1. 静态类型使用（包含基础静态类型和对象静态类型）**

- 变量的类型不能改变
- 类型的属性和方法也随之确定

**2. 创建项目文件夹，并创建一个.ts 结尾的文件，编写如下代码：**

```ts
let count: number = 1

// 定义接口类型User
interface User {
	uname: string
	age: number
}

// 实现方法
const xiaohong: User = {
	uname: '小红',
	age: 18,
}

// 打印xiaohong的年龄
console.log(xiaohong.age)
```

**3. 运行测试，在终端下执行 ts-node demo2.ts 命令**

```@terminal
ts-node demo2.ts
```

**4.基础静态类型**

- 基础静态类型包含 null,undefinde,boolean,void,symbol 等

```ts
// 基础静态类型写法（变量名+类型+赋值）
// boolean类型
let isDone: boolean = false
// number类型
let count1: number = 918
// string类型
let myName: string = '小明'
name = 'sub'
// void类型
function warnUser(): void {
	console.log('This is my warning message')
}
// null和undefined类型
let u: undefined = undefined
let n: null = null
```

**5.对象静态类型**

- 对象静态类型包含普通对象类型、数组类型、类类型、函数类型

```ts
// 普通对象类型
const friend: {
	name: string
	age: number
} = {
	name: '小红',
	age: 22,
}

// 定义friends对象静态类型并赋值（数组）
const friends: string[] = ['小红', '小明', '小兰']

// 类
class Person {}
const xiaolan: Person = new Person()

// 函数类型
const jianXiao: () => string = () => {
	return '小兰'
}
```

**6. 类型注解（type annotation）**

```ts
// 当鼠标停在count2上时，会显示其为number类型，这就是类型注解
let count2: number
count2 = 100
// total不用给注解了
function getTotal(one: number, two: number) {
	return one + two
}
const total = getTotal(1, 2)
```

**7. 类型推断（type inference）**

```ts
let countInference = 123
// 把鼠标放在Friend对象上面，就会提示出它的属性，这表明 TypeScript 也分析出了对象的属性的类型。
const Friend = {
	name: '小明',
	age: 19,
}
```

- 潜规则
  - 如果 TS 能够自动分析变量类型， 我们就什么也不需要做了
  - 如果 TS 无法分析变量类型的话， 我们就需要使用类型注解

**8. 函数参数和返回类型定义**

```ts
// 函数无返回值时的定义
function sayHello() {
	console.log('hello world')
}

// never返回值类型
function forNever(): never {
	while (true) {}
	console.log('Hello JSPang')
}
```

**9. 数组类型**

```ts
// 一般数组类型的定义
const numberArr: number[] = [1, 2, 3]
// 字符串类型数组
const stringArr: string[] = ['a', 'b', 'c']
// 数字加字符串的数组
const arr: (number | string)[] = [1, 'string', 2]

// 对象类型定义，类型别名，定义别名的时候要以type关键字开始
type User = { name: string; age: Number }
const gaming: User[] = [
	{ name: '小明', age: 19 },
	{ name: '小红', age: 21 },
]
```

**10. 元组的使用和类型约束(用的少)**

- 一般只在数据源是 CVS 这种文件的时候，会使用元组。

```ts
const Users: [string, string, number][] = [
	['xiaohong', 'teacher', 28],
	['liuying', 'teacher', 18],
	['cuihua', 'teacher', 25],
]
```

#### 注意事项

- 例子中定义了 uname 为 string 类型，在赋值时只能赋值为 string 类型的值
- 尽量用 let 语句来声明变量，而不是 var

## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2

## **步骤说明**

**1. 类的基本使用**

```ts
// 使用class关键字定义Register类
class Register {
	content = 'Hi，你好！'
	sayHello() {
		return this.content
	}
}

// 调用类
const glop = new Register()
console.log(glop.sayHello())
```

**2. 类的继承**

```ts
// 使用class关键字定义Register类
class Register {
	content = 'Hi，靓仔！'
	sayHello() {
		return this.content
	}
}

// 继承Register父类
class add extends Register {
	sayLove() {
		return 'I love you'
	}
}

// 调用类，父类里面有的内容，子类里也有
const glop = new add()
console.log(glop.sayHello())
console.log(glop.sayLove())
```

**3. 类的重写**

```ts
// 重写Register父类的sayHello方法
class add extends Register {
	sayLove() {
		return 'I love you'
	}
	sayHello() {
		return 'Hi, honey!'
	}
}
```

**4. super 关键字的使用**

```ts
// 通过super关键字，扩展父类的功能
class add extends Register {
	sayLove() {
		return 'I love you!'
	}
	sayHello() {
		return super.sayHello() + '你好！'
	}
}
```

**5. 类的访问类型(三个关键词 private、protected 和 public)**

- 关键字为 public 时，在类的内部和外部都能使用
- 关键字为 private 时，只能在类的内部使用，继承和外部调用时会报错
- 关键字为 protected 时，在继承中能使用，外部不能使用

```ts
// 类的内部（即{}内的内容），默认是Public类型的
class Person {
	name: string
	public sayHello() {
		console.log(this.name + ' say Hello')
	}
}

//-----以下属于类的外部-----
// 调用类
const person = new Person()
// 赋值
person.name = 'liwei'
// 调用sayHello方法
person.sayHello()
console.log(person.name)
```

**6. 类的构造函数**

```ts
class Person {
	// 构造函数constructor关键字
	constructor(public name: string) {}
}

// Teacher子类继承Person父类
class Teacher extends Person {
	// 子类中使用构造函数时，必须调用父类构造函数，并使用super关键字才不会报错
	constructor(public age: number) {
		super('xiaohong')
	}
}

// 调用
const teacher = new Teacher(18)
console.log(teacher.name)
console.log(teacher.age)
```

**7. 类的 Getter、Setter 和 static 的使用**

```ts
// private用来封装一个属性，然后通过 Getter 和 Setter 的形式来访问和修改这个属性
class Person {
	constructor(private _age: number) {}
	get age() {
		return this._age - 10
	}
	set age(age: number) {
		this._age = age
	}
}

// 调用类
const person = new Person(28)
// 赋值
console.log(person.age)

// -------静态类使用（static）--------
class Girl {
	static sayLove() {
		return 'I Love you'
	}
}
console.log(Girl.sayLove())

// ------类的只读属性(readonly)------
class Person {
	public readonly _name: string
	constructor(name: string) {
		this._name = name
	}
}
const person = new Person('xiaoming')
//person._name = '小红' //此时不能修改name属性，否则会报错
console.log(person.name)
```

**8. 抽象类**

- 抽象类和父类很像，都需要继承，但是抽象类里一般都有抽象方法。继承抽象类的类必须实现抽象方法才可以。

```ts
// 定义一个Recruit抽象类，关键字是abstract
abstract class Recruit {
	abstract skill() //因为没有具体的方法，所以我们这里不写括号
}

//--------继承抽象类的类必须实现抽象类的方法--------
// 设计师类继承Recruit抽象类
class Designer extends Recruit {
	skill() {
		console.log('网站设计')
	}
}

// 后端工程师类继承Recruit抽象类
class AfterEnd extends Recruit {
	skill() {
		console.log('后端服务实现')
	}
}

// 架构师类继承Recruit抽象类
class Architect extends Recruit {
	skill() {
		console.log('系统架构开发')
	}
}
```

#### 注意事项

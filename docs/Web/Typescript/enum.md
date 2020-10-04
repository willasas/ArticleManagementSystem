## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- node.js 环境
- TypeScript 4.0.2

## **步骤说明**

**1. 枚举类型**

```ts
// 枚举类型
enum Status {
	MALE = 1, //设置下标从1开始，默认从0开始
	FEMALE,
	DEFAULT,
}

function getServe(status: any) {
	if (status === Status.MALE) {
		return '男'
	} else if (status === Status.FEMALE) {
		return '女'
	} else if (status === Status.DEFAULT) {
		return '默认值'
	}
}

// 通过反差的方法，得到枚举的值
console.log(Status.FEMALE, Status[2])
const result = getServe(1)
console.log(`性别为${result}`)
```

#### 注意事项

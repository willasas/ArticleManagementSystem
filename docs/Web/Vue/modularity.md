## **环境说明**

#### 准备工作

- node.js version > 8.9
- @vue/cli 4.5.6
- [vue-cli 官网](https://github.com/vuejs/vue-cli)

## **步骤说明**

**1. 在 src 目录下新建 hooks 文件夹，然后再新建一个 useNowTime.ts 的文件，代码如下：**

- hooks(所有抽离出来的功能模块都可以放到这个文件夹里)，
- 文件名使用 use 开头，代表是一个抽离出来的模块

```ts
import { ref } from 'vue'

const nowTime = ref('00:00:00')
const getNowTime = () => {
	const now = new Date()
	const hour = now.getHours() < 10 ? '0' + now.getHours() : now.getHours()
	const minu = now.getMinutes() < 10 ? '0' + now.getMinutes() : now.getMinutes()
	const sec = now.getSeconds() < 10 ? '0' + now.getSeconds() : now.getSeconds()
	nowTime.value = hour + ':' + minu + ':' + sec

	setTimeout(getNowTime, 1000)
}

export { nowTime, getNowTime }
```

**2. 组件使用**

- 在 App.vue 中引入 useNowTime.ts 文件

#### 注意事项

- 在代码的最前面用 import 进行引入 ref,在最后用 export 的方式，导出 nowTime 和 getNowTime.

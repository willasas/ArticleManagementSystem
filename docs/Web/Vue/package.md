## **环境说明**

#### 准备工作

- node.js version > 8.9
- @vue/cli 4.5.6
- [vue-cli 官网](https://github.com/vuejs/vue-cli)

## **步骤说明**

**1. package.json 文件介绍**

```json
{
	"name": "vue3-2", //项目名
	"version": "0.1.0", //版本号
	"private": true, //私有
	"scripts": {
		"serve": "vue-cli-service serve", //yarn serve/npm run serve在开发时用于查看效果的命令
		"build": "vue-cli-service build", //yarn build/npm run build打包打码，一般用于生产环境中使用
		"lint": "vue-cli-service lint" //yarn lint/npm run lint检查代码中的编写规范
	},
	//生产环境安装包信息
	"dependencies": {
		"vue": "^3.0.0-0"
	},
	//开发环境安装包信息
	"devDependencies": {
		"@typescript-eslint/eslint-plugin": "^2.33.0",
		"@typescript-eslint/parser": "^2.33.0",
		"@vue/cli-plugin-eslint": "~4.5.0",
		"@vue/cli-plugin-typescript": "~4.5.0",
		"@vue/cli-service": "~4.5.0",
		"@vue/compiler-sfc": "^3.0.0-0",
		"@vue/eslint-config-typescript": "^5.0.2",
		"eslint": "^6.7.2",
		"eslint-plugin-vue": "^7.0.0-0",
		"typescript": "~3.9.3"
	},
	//eslint配置信息
	"eslintConfig": {
		"root": true,
		"env": {
			"node": true
		},
		"extends": [
			"plugin:vue/vue3-essential",
			"eslint:recommended",
			"@vue/typescript/recommended"
		],
		"parserOptions": {
			"ecmaVersion": 2020
		},
		"rules": {}
	},
	//浏览器兼容性设置
	"browserslist": ["> 1%", "last 2 versions", "not dead"]
}
```

**2. main.js/main.ts (入口)文件介绍**

```ts
import { createApp } from 'vue' // 引入vue文件，并导出`createApp`
import App from './App.vue' // 引入自定义组件，你在页面上看的东西基本都在这个组件里

createApp(App).mount('#app') // 把App挂载到#app节点上，在public目录下的index.html找节点
```

**3. App.vue 文件介绍**

```vue
<template>
	<img alt="Vue logo" src="./assets/logo.png" />
	<!--3.实现组件方法-->
	<HelloWorld msg="Welcome to Your Vue.js + TypeScript App" />
</template>

<script lang="ts">
import { defineComponent } from 'vue'
// 1.引入HelloWorld自定义组件
import HelloWorld from './components/HelloWorld.vue'

export default defineComponent({
	name: 'App',
	// 2.组件名
	components: {
		HelloWorld,
	},
})
</script>

<style>
#app {
	font-family: Avenir, Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	text-align: center;
	color: #2c3e50;
	margin-top: 60px;
}
</style>
```

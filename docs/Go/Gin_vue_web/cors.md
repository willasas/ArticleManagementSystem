## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）/Linux/MAC OS

## **步骤说明**

**1. 安装 axios 和 vue-axios 插件,在 main.js 中引入，复制如下代码，并在编辑器终端执行**

```@Termnial
npm install axios
npm install vue-axios
```

```@main.js
import Vue from 'vue';
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue';
import Vuelidate from 'vuelidate';
import axios from 'axios';
import VueAxios from 'vue-axios';
import App from './App.vue';
import router from './router';
import store from './store';

// scss style
import './assets/scss/index.scss';

Vue.config.productionTip = false;

// Install BootstrapVue
Vue.use(BootstrapVue);
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin);
Vue.use(Vuelidate);
Vue.use(VueAxios, axios);

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount('#app');
```

1.2 在 register.vue 中引入对应的 API，实现表单验证：

```@register.vue

```

![配置项目](../../img/go_img/test32.png)

**2. 使用 axios 处理请求 api**

## **CSS 书写规范总结**

#### 命名规则

**1. 常用的 CSS 命名规则**

- 使用语义化的文件命名，文件名要能“望文生义”，尽量避免使用拼音；
- 文件名只使用字母 a-z，数字 0-9，连字符 -，下划线 \_ 和句点 .；
- 文件命名以字母开头而不是数字，而以特殊字符开头命名的文件，一般都有特殊的含义与用处；
- 文件名中字母全部采用小写，多个单词用下划线分隔（识别效率较驼峰体高）；
- 如需缩写单词，则应使用约定俗成的缩写形式，如 btn、nav、num、img 等，不能自造单词，以免引起歧义。

**2. 注释的写法**

- 参照通用规则
- 要合理将文件分类到不同目录，避免一个目录下存放大量的文件。

**3. ID 的命名**

- 3.1. 页面结构

| 说明                     | 表示              |
| ------------------------ | ----------------- |
| 容器                     | container         |
| 页头                     | header            |
| 内容                     | content/container |
| 页面主体                 | main              |
| 页尾                     | footer            |
| 导航                     | nav               |
| 侧栏                     | sidebar           |
| 栏目                     | column            |
| 页面外围控制整体佈局宽度 | wrapper           |
| 左右中                   | left right center |

- 3.2. 导航

| 说明   | 表示         |
| ------ | ------------ |
| 导航   | nav          |
| 主导航 | mainnav      |
| 子导航 | subnav       |
| 顶导航 | topnav       |
| 边导航 | sidebar      |
| 左导航 | leftsidebar  |
| 右导航 | rightsidebar |
| 菜单   | menu         |
| 子菜单 | submenu      |
| 标题   | title        |
| 摘要   | summary      |

- 3.3. 功能

| 说明     | 表示      |
| -------- | --------- |
| 标志     | logo      |
| 广告     | banner    |
| 登陆     | login     |
| 登录条   | loginbar  |
| 注册     | register  |
| 搜索     | search    |
| 功能区   | shop      |
| 标题     | title     |
| 加入     | joinus    |
| 状态     | status    |
| 按钮     | btn       |
| 滚动     | scroll    |
| 标签页   | tab       |
| 文章列表 | list      |
| 提示信息 | msg       |
| 当前的   | current   |
| 小技巧   | tips      |
| 图标     | icon      |
| 注释     | note      |
| 指南     | guild     |
| 服务     | service   |
| 热点     | hot       |
| 新闻     | news      |
| 下载     | download  |
| 投票     | vote      |
| 合作伙伴 | partner   |
| 友情链接 | link      |
| 版权     | copyright |

**4. CSS 样式表文件命名**

| 样式表名    | 说明       |
| ----------- | ---------- |
| master.css  | 主要的     |
| module.css  | 模块       |
| base.css    | 基本共用   |
| layout.css  | 布局、版面 |
| themes.css  | 主题       |
| columns.css | 专栏       |
| font.css    | 文字       |
| forms.css   | 表单       |
| mend.css    | 补丁       |
| print.css   | 打印       |

#### 实用的 CSS 样式

**1. ::-Webkit-Input-Placeholder**

- input 的 H5 placeholder 属性，很好用，但不能直接改这个文字颜色，所以目前的解决方法就是用::input-placeholder 属性来改。
- 提示: 配合 opacity 属性使用效果更佳哦！

```CSS
::-webkit-input-placeholder { /* Chrome/Opera/Safari */  color: pink;}::-moz-placeholder { /* Firefox 19+ */  color: pink;}:-ms-input-placeholder { /* IE 10+ */  color: pink;}:-moz-placeholder { /* Firefox 18- */  color: pink;}
```

**2. @Impor 嵌套样式表文件**

- 使用它可以在样式表再次内嵌套样式表文件，比如一些组件 CSS 可以使用，但不太推荐使用这个，因为加载时有可能会被漏掉。

```CSS
@import url("reset.css");
@import url("global.css");
@import url("font.css");
```

**3. Outline 当点击 Input 元素时显示的当前状态线（外发光）**

```CSS
div {
  outline: none; //移动浏览器默认的状态线
  // outline: 5px dotted red; 也可以设置样式
  }
```

**4. Contenteditable 设置 Element 是否可编辑**

```HTML
<p contenteditable="true">可编辑</p>
```

**5. Webkit-Playsinline**

- 手机 video 都可以在页面中播放，而不是全屏播放了

```HTML
<video id="myvideo" src="test.mp4" webkit-playsinline="true"></video>
```

**6. Position: Absolute， 让 Margin 有效的**

- 设置 left:0, right:0 就可以。原因是 2 边都是 0 不存在边距，element 就可以得出距离，并居中。

```CSS
div {
  position: absolute;
  left: 0;
  right: 0;
  margin: 0 auto;
  }
```

**7. 使用 Clearfix 清楚浮动，解决父类高度崩塌**

```CSS
.clearfix {zoom: 1;}
.clearfix:after {
  visibility: hidden;
  display: block;
  font-size: 0;
  content: " ";
  clear: both;
  height: 0;
  }
```

**8. User-Select 禁止用户选中文本**

```CSS
div { user-select: none; /* Standard syntax */}
```

**9. 清除手机 Tap 事件后 Element 时候出现的一个高亮**

```CSS
*{ -webkit-tap-highlight-color: rgba(0,0,0,0);}
```

**10. ::-Webkit-Scrollbar-Thumb**

- 可以修改谷歌的滚动条样式，safari 好像也可以

**11. -Webkit-Appearance:none**

- 11.1 To apply platform specific styling to an element that doesn’t have it by default
- 11.2 To remove platform specific styling to an element that does have it by default
  移除浏览器默认的样式，比如 chrome 的 input 默认样式

```CSS
input, button, textarea, select {
  *font-size: 100%;
  -webkit-appearance:none;
  }
```

**12. CSS 开启硬件加速**

```CSS
-webkit-transform: translateZ(0);
```

**13. 使用 CSS Transforms 或者 Animations 时可能会有页面闪烁的 Bug**

```CSS
-webkit-backface-visibility: hidden;
```

**14. \*-Webkit-Touch-Callout 禁止长按链接与图片弹出菜单**

```CSS
-webkit-touch-callout: none;
```

**15. Transform-Style: Preserve-3d 让元素支持 3d**

```CSS
div { -webkit-transform: rotateY(60deg);  /* Chrome, Safari, Opera */
      -webkit-transform-style: preserve-3d; /* Chrome, Safari, Opera */
      transform: rotateY(60deg);
      transform-style: preserve-3d;
  }
```

**16. Perspective 透视**

- 这个属性的存在决定你看到的元素是 2d 还是 3d。一般设置在包裹元素的父类上。

```CSS
.div-box {perspective: 400px; }
```

**17. Css 实现不换行、自动换行、强制换行**

```CSS
.style {
    //不换行
    white-space:nowrap;
    //自动换行
    word-wrap: break-word;
    //控制单词如何被拆分换行。它有三个值：normal | break-all | keep-all
    word-break: normal;
    //强制换行
    word-break:break-all;
}
```

**18. Box-Sizing 让元素的宽度、高度包含 Border 和 Padding**

```CSS
.box {
    box-sizing: border-box;
}
```

**19. Calc() Function, 计算属性值**

- 让宽度为 100%减去 100px 的值，项目中很适用，要 IE9 以上兼容。

```CSS
div { width: calc(100% - 100px);}
```

**20. Css3 Linear-Gradient 线性渐变**

- 默认开始在 top, 也可以自定义方向

```CSS
div {
     linear-gradient(red, yellow)}background: linear-gradient(direction, color-stop1, color-stop2);
}
```

**21. 常用的选择器 :Nth-Child() Selector**

- 以下代码是选择父类下第一个子节点，p 元素，建议学习这个样式属性的使用，很实用的

```CSS
p:nth-child(1) { ... }
```

**22. css一行文本超出显示...**

```CSS
overflow: hidden;
text-overflow:ellipsis;
white-space: nowrap;
```

**23. 多行文本超出显示...**

```CSS
display: -webkit-box;
-webkit-box-orient: vertical;
-webkit-line-clamp: 3;
overflow: hidden;
```

**24. IOS 手机容器滚动条滑动不流畅**

```CSS
overflow: auto;
-webkit-overflow-scrolling: touch;
```

**25. 修改滚动条样式**

- 隐藏div元素的滚动条

```CSS
/*div::-webkit-scrollbar 滚动条整体部分*/
div::-webkit-scrollbar {
    display: none;
}

/*div::-webkit-scrollbar-thumb 滚动条里面的小方块，能向上向下移动（或往左往右移动，取决于是垂直滚动条还是水平滚动条)
div::-webkit-scrollbar-track 滚动条的轨道（里面装有 Thumb)
div::-webkit-scrollbar-button 滚动条的轨道的两端按钮，允许通过点击微调小方块的位置
div::-webkit-scrollbar-track-piece 内层轨道，滚动条中间部分（除去)
div::-webkit-scrollbar-corner 边角，即两个滚动条的交汇处
div::-webkit-resizer 两个滚动条的交汇处上用于通过拖动调整元素大小的小控件注意此方案有兼容性问题，一般需要隐藏滚动条时我都是用一个色块通过定位盖上去，或者将子级元素调大，父级元素使用 overflow-hidden 截掉滚动条部分。暴力且直接。*/
```

**26. css 写出一个三角形角标**

- 元素宽高设置为 0，通过 border 属性来设置，让其它三个方向的 border 颜色为透明或者和背景色保持一致，剩余一条 border 的颜色设置为需要的颜色

```CSS
div {
    width: 0;
    height: 0;
    border: 5px solid #transparent;
    border-top-color: red;
}
```

**27. 解决 ios audio 无法自动播放、循环播放的问题**

- ios 手机在使用 audio 或者 video 播放的时候，个别机型无法实现自动播放，可使用下面的代码 hack。ios 手机在使用 audio 或者 video 播放的时候，个别机型无法实现自动播放，可使用下面的代码 hack。

```js
// 解决ios audio无法自动播放、循环播放的问题
var music = document.getElementById('video');
var state = 0;

document.addEventListener('touchstart', function(){
    if(state==0){
        music.play();
        state=1;
    }
}, false);

document.addEventListener("WeixinJSBridgeReady", function () {
    music.play();
}, false);

//循环播放
music.onended = function () {
    music.load();
    music.play();
}// 解决ios audio无法自动播放、循环播放的问题
var music = document.getElementById('video');
var state = 0;

document.addEventListener('touchstart', function(){
    if(state==0){
        music.play();
        state=1;
    }
}, false);

document.addEventListener("WeixinJSBridgeReady", function () {
    music.play();
}, false);

//循环播放
music.onended = function () {
    music.load();
    music.play();
}
```

**28. 水平垂直居中**

- 使用两种方式: 定位 或者 flex

```CSS
div {
    width: 100px;
    height: 100px;
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    margin: auto;
}
```

- 父级控制子集居中

```CSS
.parent {
    display: flex;
    justify-content: center;
    align-items: center;
}
```

**29. 隐藏页面元素**

- display-none: 元素不存在，从 dom 中删除
- opacity-0: 元素透明度将为 0，但元素仍然存在，绑定的事件仍旧有效仍可触发执行。
- visibility-hidden：元素隐藏，但元素仍旧存在，页面中无法触发该元素的事件。display-none: 元素不存在，从 dom 中删除

```CSS

```

**29. 前端工程化**

- 一般来说前端工程包含，项目初始化，项目开发，集成，构建，打包，测试，部署等流程。工程化就是以工程的角度来解决这些问题。比如项目初始化我们一般使用npm init, 创建页面模板使用 plop，我们喜欢使用 ES6+开发，但是需要通过 babel 编码成 ES5，持续集成的时候我们使用 git，但是为了保持开发规范我们引入了 ESLint，部署一般使用 ci/cd 或者 jenkins 等等。

**30. contenteditable**

- html 中大部分标签都是不可以编辑的，但是添加了 contenteditable 属性之后，标签会变成可编辑状态。通过这个属性把标签变为可编辑状态后只有 input 事件，没有 change 事件。也不能像表单一样通过 maxlength 控制最大长度。

```HTML
<div contenteditable="true"></div>
```

**31. calc**

- 这是一个 css 属性，我一般称之为 css 表达式。可以计算 css 的值。最有趣的是他可以计算不同单位的差值。缺点是不容易阅读。

```CSS
div {
    width: calc(25% - 20px);
}
```

**32. Proxy 和 Object.defineProperty 区别**

```js
new Proxy(target, {
    get(target, property) {

    },
    set(target, property) {

    },
    deleteProperty(target, property) {

    }
})
```

- 通过 new 的方式创建对象，第一个参数是被拦截的对象，第二个参数是对象操作的描述。实例化后返回一个新的对象，当我们对这个新的对象进行操作时就会调用我们描述中对应的方法。
- Object.defineProperty 只能监听到属性的读写，而 Proxy 除读写外还可以监听属性的删除，方法的调用等。
- 通常情况下我们想要监视数组的变化，基本要依靠重写数组方法的方式实现，这也是 Vue 的实现方式，而 Proxy 可以直接监视数组的变化。

```js
const list = [1, 2, 3];
const listproxy = new Proxy(list, {
    set(target, property, value) {
        target[property] = value;
        return true; // 标识设置成功
    }
});

list.push(4);
```

- Proxy 是以非入侵的方式监管了对象的读写，而 defineProperty 需要按特定的方式定义对象的属性。

**33. Reflect**

- 他是 ES2015 新增的对象，纯静态对象也就是不能被实例化，只能通过静态方法的方式调用，和 Math 对象类似，只能类似 Math.random 的方式调用。
- Reflect 内部封装了一系列对对象的底层操作，一共 14 个，其中 1 个被废弃，还剩下 13 个。
- Reflect 的静态方法和 Proxy 描述中的方法完全一致。也就是说 Reflect 成员方法就是 Proxy 处理对象的默认实现。
- Proxy 对象默认的方法就是调用了 Reflect 内部的处理逻辑，也就是如果我们调用 get 方法，那么在内部，proxy 就是将 get 原封不动的交给了 Reflect，如

```js
const proxy = new Proxy(obj, {
    get(target, property) {
        return Reflect.get(target, property);
    }
})
```

**34. 解析 get 参数**

- 通过 replace 方法获取 url 中的参数键值对，可以快速解析 get 参数。

```js
const q = {};
location.search.replace(/([^?&=]+)=([^&]+)/g,(_,k,v)=>q[k]=v);
console.log(q);
```

**35. 解析连接 url**

- 可以通过创建 a 标签，给 a 标签赋值 href 属性的方式，获取到协议，pathname，origin 等 location 对象上的属性。

```js
// 创建a标签
const aEle = document.createElement('a');
// 给a标签赋值href路径
aEle.href = '/test.html';
// 访问aEle中的属性
aEle.protocol; // 获取协议
aEle.pathname; // 获取path
aEle.origin;
aEle.host;
aEle.search;
```

#### 注意事项

1.ID 的命名

- 一律小写;
- 尽量用英文;
- 不加中横线和下划线;
- 尽量不缩写，除非一看就明白的单词。

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

#### 注意事项

1.ID 的命名

- 一律小写;
- 尽量用英文;
- 不加中横线和下划线;
- 尽量不缩写，除非一看就明白的单词。

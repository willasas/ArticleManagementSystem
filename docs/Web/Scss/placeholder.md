## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. 占位符选择器**

- Sass 额外提供了一种特殊类型的选择器：占位符选择器 (placeholder selector)。与常用的 id 与 class 选择器写法相似，只是 # 或 . 替换成了 %。必须通过 @extend 指令调用。

```scss
@import "base";

.alert {
  padding: 15px;
}

.alert a {
  font-weight: bold;
}

.alert-info {
  @extend .alert;
  background-color: #d9edf7;
}
```

- 编译为

```css
@charset "UTF-8";

.body {
  margin: 0;
  padding: 0;
}

.alert .alert-info {
  padding: 15px;
}

.alert a, .alert-info a {
  font-weight: bold;
}

.alert-info {
  background-color: #d9edf7;
}
```

- 当占位符选择器单独使用时（未通过 @extend 调用），不会编译到 CSS 文件中。
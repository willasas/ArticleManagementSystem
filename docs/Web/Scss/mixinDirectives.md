## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. 定义混合指令 @mixin**

- 混合指令的用法是在 @mixin 后添加名称与样式，比如名为 large-text 的混合通过下面的代码定义

```scss
@mixin large-text {
  font: {
    family: Arial;
    size: 20px;
    weight: bold;
  }
  color: #ff0000;
}

// 用 & 引用父选择器
@mixin clearfix {
  display: inline-block;
  &:after {
    content: ".";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
  }
  * html & { height: 1px }
}
```

**2. 引用混合样式 @include**

- 使用 @include 指令引用混合样式，格式是在其后添加混合名称，以及需要的参数（可选）：

```scss
.page-title {
  @include large-text;
  padding: 10px;
  margin-top: 4px;
}
```

- 编译为

```css
.page-title {
  font-family: Arial;
  font-size: 20px;
  font-weight: bold;
  color: #ff0000;
  padding: 10px;
  margin-top: 4px;
}
```

**3. 向混合样式中导入内容**

- 在引用混合样式的时候，可以先将一段代码导入到混合指令中，然后再输出混合样式，额外导入的部分将出现在 @content 标志的地方：
- @mixin 可以用 = 表示，而 @include 可以用 + 表示.
- 当 @content 在指令中出现过多次或者出现在循环中时，额外的代码将被导入到每一个地方。

```scss
@mixin apply-to-ie6-only {
  * html {
    @content;
  }
}
@include apply-to-ie6-only {
  #logo {
    background-image: url(/logo.gif);
  }
}
```

- 编译为

```css
* html #logo {
  background-image: url(/logo.gif);
}
```
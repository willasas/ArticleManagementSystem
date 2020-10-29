## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. 嵌套规则**

- Sass允许将一套CSS样式嵌套进另一套样式中，内层的样式将其外层的选择器作为父选择器

```scss
.nav {
  height: 100px;
  ul {
    margin: 0;
    li {
      float: left;
      list-style: none;
      padding: 5px;
    }
  }
}
```

- 编译为

```css
.nav {
  height: 100px;
}
.nav ul {
  margin: 0;
}
.nav ul li {
  float: left;
  list-style: none;
  padding: 5px;
}
```

**2. 属性嵌套**

- 有些 CSS 属性遵循相同的命名空间 (namespace)，比如 font-family, font-size, font-weight 都以 font 作为属性的命名空间。为了便于管理这样的属性，同时也为了避免了重复输入，Sass 允许将属性嵌套在命名空间中，例如：

```scss
.body {
  font: {
    family: Helvetica, Arial, sans-serif;
    size: 15px;
    weight: bold;
  }
}

.nav {
  border: 1px solid #000;
  border-left: 0;
  border-right: 0;
}
```

编译为

```css
.body {
  font-family: Helvetica, Arial, sans-serif;
  font-size: 15px;
  font-weight: bold;
}

.nav {
  border: 1px solid #000 {
  left: 0;
  right: 0;
  }
}
```
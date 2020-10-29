## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- [SASS/SCSS 下载](https://sass-lang.com/)
- Node.js环境

## **步骤说明**

**1. 父选择器**

- 在嵌套 CSS 规则时，有时也需要直接使用嵌套外层的父选择器，例如，当给某个元素设定 hover 样式时，或者当 body 元素有某个 classname 时，可以用 & 代表嵌套规则外层的父选择器

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
    a {
      display: block;
      color: #000;
      padding: 5px;
      &:hover {
        background-color: #0d2f7e;
        color: #fff;
      }
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
.nav ul a {
  display: block;
  color: #000;
  padding: 5px;
}
.nav ul a:hover {
  background-color: #0d2f7e;
  color: #fff;
}
```

- & 必须作为选择器的第一个字符，其后可以跟随后缀生成复合的选择器,例如：

```scss
.nav {
  height: 100px;
  &-text {
    font-size: 15px;
  }
}
```

编译为

```css
.nav {
  height: 100px;
}
.nav-text {
  font-size: 15px;
}
```
## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. 圆括号（Parentheses）**

- 圆括号可以用来影响运算的顺序：

```scss
p {
  width: 1em + (2em * 3);
}
```

- 编译为

```css
p {
  width: 7em;
}
```
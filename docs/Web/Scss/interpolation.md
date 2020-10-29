## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. 插入语句**

- 通过 #{} 插值语句可以在选择器或属性名中使用变量；

- #{} 插值语句也可以在属性值中插入 SassScript，大多数情况下，这样可能还不如使用变量方便，但是使用 #{} 可以避免 Sass 运行运算表达式，直接编译 CSS。

```scss
$version: "0.0.1";
/* 项目当前版本是：#{$version} */

$name: "info";
$attr: "border";
$font-size: 12px;
$line-height: 30px;

.alert {
  #{$attr}-color: #ccc;
}

p {
  font: #{$font-size}/#{$line-height};
}
```

- 编译为

```css
@charset "UTF-8";
/* 项目当前版本是：0.0.1 */
.alert-info {
  border-color: #ccc;
}

p {
  font: 12px/30px;
}
```
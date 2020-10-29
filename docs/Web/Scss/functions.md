## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. 函数（Functions）**

- 关键词参数给函数提供了更灵活的接口，以及容易调用的参数。关键词参数可以打乱顺序使用，如果使用默认值也可以省缺，另外，参数名被视为变量名，下划线、短横线可以互换使用.

```scss
p {
  color: hsl(0, 100%, 50%);
}
// 或写成下面那样
/*p {
  color: hsl($hue: 0, $saturation: 100%, $lightness: 50%);
}
*/
```

- 编译为

```css
p {
  color: #ff0000;
}
```

**2. 自定义函数**

```scss
/* 自定义函数格式：
@function 名称 (参数1, 参数2) {
  ...
} */
$colors: (light: #ffffff, dark: #000000);

@function color($key) {
  @return map-get($colors, $key);
}

body {
  background-color: color(light);
}
```

- 编译为

```css
body {
  background-color: #ffffff;
}
```
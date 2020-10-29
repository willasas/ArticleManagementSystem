## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. 数字运算（Number Operations）**

- 数字的加减乘除、取整等运算 (+, -, *, /, %)，如果必要会在不同单位间转换值。
- 关系运算 <, >, <=, >= 也可用于数字运算，相等运算 ==, != 可用于所有数据类型。
- 以下三种情况 / 将被视为除法运算符号：
  - 如果值，或值的一部分，是变量或者函数的返回值
  - 如果值被圆括号包裹
  - 如果值是算数表达式的一部分
- 如果需要使用变量，同时又要确保 / 不做除法运算而是完整地编译到 CSS 文件中，只需要用 #{} 插值语句将变量包裹。

```scss
p {
  font: 10px/8px;             // Plain CSS, no division
  $width: 1000px;
  width: $width/2;            // Uses a variable, does division
  width: round(1.5)/2;        // Uses a function, does division
  height: (500px/2);          // Uses parentheses, does division
  margin-left: 5px + 8px/2px; // Uses +, does division
}
a {
  $font-size: 12px;
  $line-height: 30px;
  font: #{$font-size}/#{$line-height};
}
```

- 编译为

```css
p {
  font: 10px/8px;
  width: 500px;
  height: 250px;
  margin-left: 9px; 
}
a {
  font: 12px/30px;
}
```

**2. 颜色值运算（Color Operations）**

- 颜色值的运算是分段计算进行的，也就是分别计算红色，绿色，以及蓝色的值;
- 数字与颜色值之间也可以进行算数运算，同样也是分段计算的.如果颜色值包含 alpha channel（rgba 或 hsla 两种颜色值），必须拥有相等的 alpha 值才能进行运算，因为算术运算不会作用于 alpha 值。
- 颜色值的 alpha channel 可以通过 opacify 或 transparentize 两个函数进行调整。
- IE 滤镜要求所有的颜色值包含 alpha 层，而且格式必须固定 #AABBCCDD，使用 ie_hex_str 函数可以很容易地将颜色转化为 IE 滤镜要求的格式。

```scss
// //计算 01 + 04 = 05 02 + 05 = 07 03 + 06 = 09，然后编译为#050709
p {
  color: #010203 + #040506;
}
// 计算 01 * 2 = 02 02 * 2 = 04 03 * 2 = 06，然后编译为#020406
a {
  color: #010203 * 2;
}
// alpha channel的值必须一致才能进行运算
span {
  color: rgba(255, 0, 0, 0.75) + rgba(0, 255, 0, 0.75);
}
// 使用 ie_hex_str 函数将颜色转化为 IE 滤镜要求的格式
$translucent-red: rgba(255, 0, 0, 0.5);
$green: #00ff00;
div {
  filter: progid:DXImageTransform.Microsoft.gradient(enabled='false', startColorstr='#{ie-hex-str($green)}', endColorstr='#{ie-hex-str($translucent-red)}');
}
```

- 编译为

```css
p {
  color: #050709;  
}
a {
  color: #020406;
}
span {
  color: rgba(255, 255, 0, 0.75);
}
div {
  filter: progid:DXImageTransform.Microsoft.gradient(enabled='false', startColorstr=#FF00FF00, endColorstr=#80FF0000);
}
```

**3. 字符串运算（String Operations）**

- +可用于连接字符串，如果有引号字符串（位于 + 左侧）连接无引号字符串，运算结果是有引号的，相反，无引号字符串（位于 + 左侧）连接有引号字符串，运算结果则没有引号。
- 运算表达式与其他值连用时，用空格做连接符。
- 在有引号的文本字符串中使用 #{} 插值语句可以添加动态的值。
- 空的值被视作插入了空字符串。

```scss
p {
  cursor: e + -resize;
}
// 字符串运算
p:before {
  content: "Foo " + Bar;
  font-family: sans- + "serif";
}
// 空格连接
p:after {
  margin: 3px + 4px auto;
}
// #{}添加动态值
p:before {
  content: "I ate #{5 + 10} pies!";
}
```

- 编译为

```css
p {
  cursor: e-resize;
}
p:before {
  content: "Foo Bar";
  font-family: sans-serif; 
}
p:after {
  margin: 7px auto; 
}
p:before {
  content: "I ate 15 pies!"; 
}
```

**4. 布尔运算（Boolean Operations）**

- SassScript 支持布尔型的 and or 以及 not 运算。

```cmd
scss -i
// 使用and连接
>> (5px > 3px) and (5px > 10px)
false
>> (5px > 3px) and (5px < 10px)
true
// 使用or连接
>> (5px > 3px) or (5px > 10px)
true
>> (5px > 3px) or (5px < 10px)
true
// 使用not连接
>> not(5px > 3px)
false
>> not(5px < 3px)
true
```

**5. 数组运算（List Operations）**

- 数组不支持任何运算方式，只能使用 list functions 控制。

- 列表函数使用，例如：

```cmd
$ sass -i
>> length(5px 10px)
2  //表示列表项有2项
>> length(5px 10px 5px 0)
4
>> nth(5px 10px, 1)
5px //1表示取列表中的第一项
>> nth(5px 10px, 2)
10px //取列表中的第二项
>> index(1px solid red, solid)
2 //判断solid在列表项中的位置
>> append(5px 10px, 5px)
(5px 10px 5px)  //插入列表项
>> join(5px 10px, 5px 0)
(5px 10px 5px 0) //join函数可以用于组合列表
>> join(5px 10px, 5px 0, comma)
(5px 10px 5px 0) //comma可以把列表的每一项用逗号分隔开
```
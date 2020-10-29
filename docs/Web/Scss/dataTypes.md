## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. 数据类型**

- SassScript 支持6种主要的数据类型：
  - 数字，1, 2, 13, 10px
  - 字符串，有引号字符串与无引号字符串，"foo", 'bar', baz
  - 颜色，blue, #04a3f9, rgba(255,0,0,0.5)
  - 布尔型，true, false
  - 空值，null
  - 数组 (list)，用空格或逗号作分隔符，1.5em 1em 0 2em, Helvetica, Arial, sans-serif
  - maps, 相当于 JavaScript 的 object，(key1: value1, key2: value2)

- SassScript 也支持其他 CSS 属性值，比如 Unicode 字符集，或 !important 声明。然而Sass 不会特殊对待这些属性值，一律视为无引号字符串。

- 使用type-of查看数据类型,例如：

```cmd
$ sass -i
>> type-of(5)
"number"
>> type-of(5px)
"number"
>> type-of(#ff0000)
"color"
>> type-of("hello")
"string"
>> type-of(1px solid #000)
"list"
```

**2. 字符串（Strings）**

- SassScript 支持 CSS 的两种字符串类型：有引号字符串 (quoted strings)，如 "Hello World" 'http://sass-lang.com'；与无引号字符串 (unquoted strings)，如 sans-serif bold，在编译 CSS 文件时不会改变其类型。只有一种情况例外，使用 #{} (interpolation) 时，有引号字符串将被编译为无引号字符串，这样便于在 mixin 中引用选择器名：

```scss
@mixin firefox-message($selector) {
  body.firefox #{$selector}:before {
    content: "Hi, Firefox users!";
  }
}
@include firefox-message(".header");
```

- 编译为

```css
body.firefox .header:before {
  content: "Hi, Firefox users!"; }
```

- 字符串操作，例如：

```cmd
$sass -i
// 两个字符串相加
>> "hello" + world
"helloworld"
// 字符串加数字
>> "localhost" + 8080
"localhost8080"
// 两个字符串相减
>> hello - world
"hello-world"
// 两个字符串相除
>> hello / world
"hello/world"
// 两个字符串相乘会报错
>> hello * world
SyntaxError: Undefined operation: "hello times world"
```

**3. 数组（Lists）**

- 数组 (lists) 指 Sass 如何处理 CSS 中 margin: 10px 15px 0 0 或者 font-face: Helvetica, Arial, sans-serif 这样通过空格或者逗号分隔的一系列的值。事实上，独立的值也被视为数组（只包含一个值的数组）。

- Sass list functions 赋予了数组更多新功能：nth 函数可以直接访问数组中的某一项；join 函数可以将多个数组连接在一起；append 函数可以在数组中添加新值；而 @each 指令能够遍历数组中的每一项。

- 数组中可以包含子数组，比如 1px 2px, 5px 6px 是包含 1px 2px 与 5px 6px 两个数组的数组。如果内外两层数组使用相同的分隔方式，需要用圆括号包裹内层，所以也可以写成 (1px 2px) (5px 6px)。变化是，之前的 1px 2px, 5px 6px 使用逗号分割了两个子数组 (comma-separated)，而 (1px 2px) (5px 6px) 则使用空格分割(space-separated)。

- 当数组被编译为 CSS 时，Sass 不会添加任何圆括号（CSS 中没有这种写法），所以 (1px 2px) (5px 6px) 与 1px 2px, 5px 6px 在编译后的 CSS 文件中是完全一样的，但是它们在 Sass 文件中却有不同的意义，前者是包含两个数组的数组，而后者是包含四个值的数组。

- 用 () 表示不包含任何值的空数组（在 Sass 3.3 版之后也视为空的 map）。空数组不可以直接编译成 CSS，比如编译 font-family: () Sass 将会报错。如果数组中包含空数组或空值，编译时将被清除，比如 1px 2px () 3px 或 1px 2px null 3px。

- 基于逗号分隔的数组允许保留结尾的逗号，这样做的意义是强调数组的结构关系，尤其是需要声明只包含单个值的数组时。例如 (1,) 表示只包含 1 的数组，而 (1 2 3,) 表示包含 1 2 3 这个以空格分隔的数组的数组。

**4. Maps**

- Maps中的keys和values可以是sassscript的任何对象。（包括任意的sassscript表达式 arbitrary SassScript expressions） 和Lists一样Maps主要为sassscript函数服务，如 map-get函数用于查找键值，map-merge函数用于map和新加的键值融合，@each命令可添加样式到一个map中的每个键值对。 

- Maps可用于任何Lists可用的地方，在List函数中 Map会被自动转换为List ， 如 (key1: value1, key2: value2)会被List函数转换为 key1 value1, key2 value2 ，反之则不能。

```cmd
$ sass -i
// 查看map
>> $color:(light: #ffffff, dark: #000000)
(light: #ffffff, dark: #000000)
// 查看map的长度
>> length($colors)
2
// 查找dark对应的值
>> map-get($colors, dark)
#000000
// 查看map的值
>> map-values($colors)
(#ffffff, #000000)
// 查看map的keys
>> map-keys($colors)
("light", "dark"))
// 查找map是否存在某个key
>> map-has-key($colors, light)
true //返回布尔值，true表示存在
// 合并两个map
>>map-merge($colors, (light-gray: #e5e5e5))
(light: #ffffff, dark: #000000, light-gray: #e5e5e5)
// 合并两个map，并将合并后的map给一个新的map
>>$new-colors: map-merge($colors, (light-gray: #e5e5e5))
(light: #ffffff, dark: #000000, light-gray: #e5e5e5)
// 移除项目，移除多个项用逗号分隔
>> map-remove($colors, light, dark)
(light-gray: #e5e5e5) //移除后只剩light-gray这一项
```

**5. 颜色（Colors）**

- 颜色可以使用RGB(rgb(255,0,0))、十六进制(#ff0000)、字符串（red）、HSL(hsl(1, 100%, 50%))表示

- 5.1 rgb与rgba函数：

```scss
body {
  background-color: rgb(255, 0, 0);
}
// a的取值范围为0-1，数值越低透明度越高，最大值为1
head {
  color: rgba(255, 255, 0, 0.8)
}
```

- 编译为

```css
body{
  background-color: rgb(255, 0, 0);
}
head {
  color: rgba(255, 255, 0, 0.8)
}
```

- 5.2 hsl(取值范围：色相【0-360deg】 饱和度【0-100%】 明度【0-100%】)与hsla：

```scss
body{
  background-color: hsl(60, 100%, 50%);
}
head {
  color: hsla(60, 100%, 50%, 0.5)
}
```

- 编译为

```css
body{
  background-color: yellow;
}
head {
  color: rgba(255, 255, 0, 0.5)
}
```

- 5.3 adjust-hue函数,用于调整角度：

```scss
$base-color-hsl: hsl(0, 100, 50%);

body {
  background-color: adjust-hue($base-color-hsl, 137deg);
}
```

- 编译为

```css
body {
  background-color: #00ff48;
}
```

- 5.4 lighten与darken，改变颜色的明度：

```scss
$base-color: hsl(222, 100%, 50%);
$light-color: lighten($base-color, 30%);  //颜色变淡
$dark-color: darken($base-color, 20%);    //颜色加深

.alert {
  border: 1px solid $base-color;
  background-color: $light-color;
  color: $dark-color;
}
```

- 编译为

```css
.alert {
  border: 1px solid #004cff;
  background-color: #99b8ff;
  color: #002e99;
}
```

- 5.5 saturate与desaturate函数，调节饱和度：

```scss
$base-color: hsl(221, 50%, 50%);
$saturate-color: saturate($base-color, 50%);        //增加饱和度，100%
$desaturate-color: desaturate($base-color, 30%);    //减少饱和度，20%

.alert {
  background-color: $saturate-color;
}

.alert-info {
  background-color: $desaturate-color;
}
```

- 编译为

```css
.alert {
  background-color: #0051ff;
}

.alert-info {
  background-color: #667699;
}
```

- 5.6 opacify与transparentize(修改透明度)：

```scss
$base-color: hsla(222, 100%, 50%, 0.5);
$fade-in-color: opacify($base-color, 0.3);        //增加透明度，0.8
$fade-out-color: transparentize($base-color, 0.2);    //减少透明度，0.3

.alert {
  background-color: $fade-in-color;
  border: 1px solid $fade-out-color;
}
```

- 编译为

```css
.alert {
  background-color: rgba(0, 76, 255, 0.8);
  border: 1px solid rgba(0, 76, 255, 0.3);
}
```

**6. 数字**

- 在进行乘法运算时，若都带相同单位，则单位也会相乘；
- 在进行除法运算时，若都带相同单位，则单位会被抵消；
- 在进行混合运算时，遵循先乘除后加减的原则。

```cmd
$ sass -i
>> 2 + 8
10
>> 2 * 8
16
>> (8 / 2)
4
>> 5px + 5px
10px
>> 5px - 2
3px
>> 5px * 2px
10px*px
>> (10px / 2px)
5
>> (10px / 2)
5px
>>
```

- 处理数字的函数，如下：

```cmd
$ sass -i
// abs函数，返回数字的绝对值
>> abs(10)
10
>> abs(10px)
10px
>> abs(-10px)
10px
// round函数,大于等于五则进一位，否则舍弃
>> round(3.5)
4
>> round(3.2)
3
// ceil函数，不管小数位后数字是多少，都进一位
>> ceil(3.1)
4
// floor函数，与ceil函数相反，只保留整数位
>> floor(3.6)
3
// percentage函数，返回百分比
>> percentage(650px / 1000px)
65%
// min函数，返回最小的数
>> min(1, 2, 3)
1
// max函数，返回最大的数
>> max(1, 2, 3)
3
```

**7. 布尔型(true, false)**

- 比较两个值，使用and连接时，一假即假；使用or连接时，一真即真；使用not连接时，按位取反。

```cmd
$ sass -i
>> 5px > 3px
true
>> 5px > 10px
false
>> 5px < 10px
true
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
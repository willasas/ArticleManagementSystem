## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. if()**

- 内置的if（）函数允许您对条件进行分支，并只返回两个可能结果中的一个。它可以在任何脚本上下文中使用。

**2. @if**

- 当 @if 的表达式返回值不是 false 或者 null 时，条件成立，输出 {} 内的代码：

```scss
a {
  @if 1 + 1 == 2 { border: 1px solid; }
  @if 5 < 3 { border: 2px dotted; }
  @if null { border: 3px double; }
}
```

- 编译为

```css
a {
  border: 1px solid; 
}
```

- @if 声明后面可以跟多个 @else if 声明，或者一个 @else 声明。如果 @if 声明失败，Sass 将逐条执行 @else if 声明，如果全部失败，最后执行 @else 声明

```scss
$type: monster;
p {
  @if $type == ocean {
    color: blue;
  } @else if $type == matador {
    color: red;
  } @else if $type == monster {
    color: green;
  } @else {
    color: black;
  }
}
```

- 编译为

```css
p {
  color: green; 
}
```

**3. @for**

- 该指令可以在限制的范围内重复输出格式，每次按要求（变量的值）对输出结果做出变动。这个指令包含两种格式：`@for $var from <start> through <end>`，或者 `@for $var from <start> to <end>`，区别在于 through 与 to 的含义：当使用 through 时，条件范围包含 `<start> 与 <end>` 的值，而使用 to 时条件范围只包含 `<start> 的值不包含 <end> 的值`。另外，$var 可以是任何变量，比如 $i；`<start> 和 <end> 必须是整数值`。

```scss
@for $i from 1 through 3 {
  .item-#{$i} { width: 2em * $i; }
}
```

- 编译为

```css
.item-1 {
  width: 2em; }
.item-2 {
  width: 4em; }
.item-3 {
  width: 6em; }
```

**4. @each**

- @each 指令的格式是 `$var in <list>`, $var 可以是任何变量名，比如 $length 或者 $name，而 list 是一连串的值，也就是值列表。
- @each 将变量 $var 作用于值列表中的每一个项目，然后输出结果

```scss
@each $animal in puma, sea-slug, egret, salamander {
  .#{$animal}-icon {
    background-image: url('/images/#{$animal}.png');
  }
}
```

- 编译为

```css
.puma-icon {
  background-image: url('/images/puma.png'); 
}
.sea-slug-icon {
  background-image: url('/images/sea-slug.png'); 
}
.egret-icon {
  background-image: url('/images/egret.png'); 
}
.salamander-icon {
  background-image: url('/images/salamander.png'); 
}
```

4.2 @echo加列表

```scss
@echo $fruits, $colors, $tag in (apple, red, fire),(banana, yellow, rock),(grape, purple, thunder) {
  .#{$fruits}-icon {
    background-image: url('img/#{$fruits}.png');
    border: 2px solid $color;
    cursor: $tag;
  }
}
```

- 编译为

```css
.apple-icon {
  background-image: url('img/apple.png');
  border: 2px solid red;
  cursor: fire;
}
.banana-icon {
  background-image: url('img/banana.png');
  border: 2px solid yellow;
  cursor: rock;
}
.grape-icon {
  background-image: url('img/grape.png');
  border: 2px solid purple;
  cursor: thunder;
}
```

**5. @while**

- @while 指令重复输出格式直到表达式返回结果为 false.(较为少用)

```scss
$i: 6;
@while $i > 0 {
  .item-#{$i} { width: 2em * $i; }
  $i: $i - 2;
}
```

- 编译为

```css
.item-6 {
  width: 12em; }

.item-4 {
  width: 8em; }

.item-2 {
  width: 4em; }
```
## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. @import**

- Sass 拓展了 @import 的功能，允许其导入 SCSS 或 Sass 文件。被导入的文件将合并编译到同一个 CSS 文件中，另外，被导入的文件中所包含的变量或者混合指令 (mixin) 都可以在导入的文件中使用。

- Sass 在当前地址，或 Rack, Rails, Merb 的 Sass 文件地址寻找 Sass 文件，如果需要设定其他地址，可以用 :load_paths 选项，或者在命令行中输入 --load-path 命令。

- 在以下情况下，@import 仅作为普通的 CSS 语句，不会导入任何 Sass 文件:
  - 文件拓展名是 .css；
  - 文件名以 http:// 开头；
  - 文件名是 url()；
  - @import 包含 media queries。

```scss
@import "foo.css";
@import "foo" screen;
@import "http://foo.com/bar";
@import url(foo);
// 同时导入多个文件
@import "rounded-corners", "text-shadow";
```

- 编译为

```css
@import "foo.css";
@import "foo" screen;
@import "http://foo.com/bar";
@import url(foo);
```

**2. 分音**

- 如果需要导入 SCSS 或者 Sass 文件，但又不希望将其编译为 CSS，只需要在文件名前添加下划线，这样会告诉 Sass 不要编译这些文件，但导入语句中却不需要添加下划线。

```scss
// 将文件命名为 _colors.scss，便不会编译 _colors.css 文件
@import "colors";
```

**3. 嵌套@import**

- 可以将 @import 嵌套进 CSS 样式或者 @media 中，与平时的用法效果相同，只是这样导入的样式只能出现在嵌套的层中。

```scss
// 假定example.scss文件内存在样式.example{color: red;}
#main {
  @import "example";
}
```

- 编译为

```css
#main .example {
  color: red;
}
```

**4. @media**

- Sass 中 @media 指令与 CSS 中用法一样，只是增加了一点额外的功能：允许其在 CSS 规则中嵌套。如果 @media 嵌套在 CSS 规则内，编译时，@media 将被编译到文件的最外层，包含嵌套的父选择器。

```scss
.sidebar {
  width: 300px;
  @media screen and (orientation: landscape) {
    width: 500px;
  }
}
```

- 编译为

```css
.sidebar {
  width: 300px; 
}
@media screen and (orientation: landscape) {
  .sidebar {
    width: 500px; 
  } 
}
```

**5. @extend(继承)**

- 继承可以减少代码重复，提高代码可复用性。

```scss
.alert {
  padding: 15px;
}

// 延伸复杂的选择器：.alert-info下的a标签同意会继承此样式
.alert a {
  font-weight: bold;
}

// .alert-info继承了.alert的样式
.alert-info {
  @extend .alert;
  background-color: #d9edf7;
}
```

- 编译为

```css
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

**6. 多重延伸**

- 同一个选择器可以延伸给多个选择器，它所包含的属性将继承给所有被延伸的选择器。
- 多重延伸可以使用逗号分隔选择器名，比如 @extend .error, .attention; 与 @extend .error; @extend.attention 有相同的效果。

```scss
.error {
  border: 1px #f00;
  background-color: #fdd;
}
.attention {
  font-size: 3em;
  background-color: #ff0;
}
// 当继承属性存在相同时，后定义的样式享有优先权，即.seriousError的背景色是background-color: #ff0;
.seriousError {
  @extend .error, .attention;
  border-width: 3px;
}
```

- 编译为

```css
.error, .seriousError {
  border: 1px #f00;
  background-color: #fdd; }

.attention, .seriousError {
  font-size: 3em;
  background-color: #ff0; }

.seriousError {
  border-width: 3px; }
```

**7. 继续延伸**

- 当一个选择器延伸给第二个后，可以继续将第二个选择器延伸给第三个

```scss
.error {
  border: 1px #f00;
  background-color: #fdd;
}
// .seriousError 选择器将包含 .error 的样式
.seriousError {
  @extend .error;
  border-width: 3px;
}
// .criticalError 不仅包含 .seriousError 的样式也会同时包含 .error 的所有样式
.criticalError {
  @extend .seriousError;
  position: fixed;
  top: 10%;
  bottom: 10%;
  left: 10%;
  right: 10%;
}
```

- 编译为

```css
.error, .seriousError, .criticalError {
  border: 1px #f00;
  background-color: #fdd; }

.seriousError, .criticalError {
  border-width: 3px; }

.criticalError {
  position: fixed;
  top: 10%;
  bottom: 10%;
  left: 10%;
  right: 10%; }
```

**8. @extend-Only选择器**

- 占位符选择器需要通过延伸指令使用，用法与 class 或者 id 选择器一样，被延伸后，占位符选择器本身不会被编译。

```scss
#context a%extreme {
  color: blue;
  font-weight: bold;
  font-size: 2em;
}
// # 或 . 被替换成了 %
.notice {
  @extend %extreme;
}
```

- 编译为

```css
#context a.notice {
  color: blue;
  font-weight: bold;
  font-size: 2em; 
}
```

**9. 错误警告**

```scss
$colors: (light: #ffffff, dark: #000000);

@function color($key) {
  // 判断$colors里是否存在名为gray的key
  @if not map-has-key($colors, $key){
    //@warn 警告信息（在命令行里查看）
    @warn "在$colors里没找到#{$key}这个key";
    //在编译文件里会出现错误提示信息
    @error "在$colors里没找到#{$key}这个key";
  }

  @return map-get($colors, $key);
}

body {
  background-color: color(gray);
}
```
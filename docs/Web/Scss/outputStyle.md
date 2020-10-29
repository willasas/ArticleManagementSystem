
**1. 输出格式（Output Style）**

- Sass 提供了四种输出格式，可以通过 :style option 选项设定，或者在命令行中使用 --style 选项

```scss
/*未编译样式*/
.box {
  width: 300px;
  height: 400px;
  &-title {
    height: 30px;
    line-height: 30px;
  }
}
```

**1.1 :nested**

- Nested （嵌套）样式是 Sass 默认的输出格式，能够清晰反映 CSS 与 HTML 的结构关系。选择器与属性等单独占用一行，缩进量与 Sass 文件中一致，每行的缩进量反映了其在嵌套规则内的层数。当阅读大型 CSS 文件时，这种样式可以很容易地分析文件的主要结构.

```css
/*命令行内容sass style.scss:style.css --style nested*/

/*编译过后样式*/
.box {
  width: 300px;
  height: 400px; }
  .box-title {
    height: 30px;
    line-height: 30px; }
```

**1.2 :expanded**

- Expanded 输出更像是手写的样式，选择器、属性等各占用一行，属性根据选择器缩进，而选择器不做任何缩进。

```css
/*命令行内容sass style.scss:style.css --style expanded*/

/*编译过后样式*/
.box {
  width: 300px;
  height: 400px;
}
.box-title {
  height: 30px;
  line-height: 30px;
}
```

**1.3 :compact**

- Compact 输出方式比起上面两种占用的空间更少，每条 CSS 规则只占一行，包含其下的所有属性。嵌套过的选择器在输出时没有空行，不嵌套的选择器会输出空白行作为分隔符。

```css
/*命令行内容sass style.scss:style.css --style compact*/

/*编译过后样式*/
.box { width: 300px; height: 400px; }
.box-title { height: 30px; line-height: 30px; }
```

**1.4 :compressed**

- Compressed 输出方式删除所有无意义的空格、空白行、以及注释，力求将文件体积压缩到最小，同时也会做出其他调整，比如会自动替换占用空间最小的颜色表达方式。

```css
/*命令行内容sass style.scss:style.css --style compressed*/

/*编译过后样式*/
.box{width:300px;height:400px}.box-title{height:30px;line-height:30px}
```
## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. Interactive Shell**

- Interactive Shell 可以在命令行中测试 SassScript 的功能。在命令行中输入 sass -i，然后输入想要测试的 SassScript 查看输出结果：

```shell
$ sass -i
>> "Hello, Sassy World!"
"Hello, Sassy World!"
>> 1px + 1px + 1px
3px
>> #777 + #777
#eeeeee
>> #777 + #888
white
```

**2. 变量**

- SassScript 最普遍的用法就是变量，变量以$符号开头，赋值方法与 CSS 属性的写法一样：

```scss
// 定义变量,变量名可以使用“_”或“-”连接
$primary-color: #1259b6;

// 变量引用
div.box {
  background-color: $primary-color;
}
```

- 编译为

```css
div.box {
  background-color: #1259b6;
}
```

**3. 全局变量与局部变量**

- 变量支持块级作用域，嵌套规则内定义的变量只能在嵌套规则内使用（局部变量），不在嵌套规则内定义的变量则可在任何地方使用（全局变量）。将局部变量转换为全局变量可以添加 !global 声明：

```scss
#main {
  $width: 5em !global;
  width: $width;
}

#sidebar {
  width: $width;
}
```

- 编译为

```css
#main {
  width: 5em;
}

#sidebar {
  width: 5em;
}
```
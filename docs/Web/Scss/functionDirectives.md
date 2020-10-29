## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- SASS 4.14.1
- Node.js环境

## **步骤说明**

**1. 定义混合指令 @mixin**

- 与 mixin 相同，也可以传递若干个全局变量给函数作为参数。一个函数可以含有多条语句，需要调用 @return 输出结果。

- 自定义的函数也可以使用关键词参数。

- 建议在自定义函数前添加前缀避免命名冲突，其他人阅读代码时也会知道这不是 Sass 或者 CSS 的自带功能。

```scss
$grid-width: 40px;
$gutter-width: 10px;

@function grid-width($n) {
  @return $n * $grid-width + ($n - 1) * $gutter-width;
}

#sidebar { width: grid-width(5); }
```

- 编译为

```css
#sidebar {
  width: 240px; 
}
```
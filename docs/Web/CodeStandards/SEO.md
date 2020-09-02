## **Head 头标签 SEO 优化总结**

#### 常见标签

**1. DOCTYPE**

- DOCTYPE(Document Type)，该声明位于文档中最前面的位置，处于 html 标签之前，此标签告知浏览器文档使用哪种 HTML 或者 XHTML 规范。
- DTD(Document Type Definition) 声明以 <!DOCTYPE> 开始，不区分大小写，前面没有任何内容，如果有其他内容(空格除外)会使浏览器在 IE 下开启怪异模式(quirks mode)渲染网页。
- DTD，名称格式为注册//组织//类型 标签//语言,注册指组织是否由国际标准化组织(ISO)注册，+表示是，-表示不是。组织即组织名称。

```html
//HTML 4.01 strict
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
//HTML 4.01 Transitional
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
//HTML 4.01 Frameset
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
//最新 HTML5 推出（推荐使用）
<!DOCTYPE html>
```

1.1 doctype 有两个主要目的：

- 对文档进行有效性验证
- 决定浏览器的呈现模式

**2. charset**

- 声明文档使用的字符编码

```html
<meta charset="utf-8" />
```

**3. lang 属性**

```html
//简体中文
<html lang="zh-cmn-Hans"></html>
//繁体中文
<html lang="zh-cmn-Hant"></html>
//英文
<html lang="en"></html>
```

**4. 浏览器内核控制**

```html
<meta name="renderer" content="webkit" />
<!--默认使用极速核-->
```

**5. 百度禁止转码**

```html
<meta http-equiv="Cache-Control" content="no-siteapp" />
```

**6. 页面标题、关键字、页面描述内容、作者、索引方式等优化**

```html
//页面标题
<title>your title</title>
//页面关键词
<meta name="keywords" content="your keywords" />
//页面描述内容
<meta name="description" content="your description" />
//网页作者
<meta name="author" content="author,email address" />
//网页搜索引擎索引方式,通常有如下几种取值：none，noindex，nofollow，all，index和follow。
<meta name="robots" content="index,follow" />
```

**7. viewport**

```html
//让viewport的宽度等于物理设备上的真实分辨率，不允许用户缩放
<meta
	name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"
/>
// 不是响应式网站，不要使用 initial-scale 或者禁用缩放
<meta name="viewport" content="width=device-width,user-scalable=yes" />
```

**8. ios 设备**

```html
//添加到主屏后的标题（iOS 6 新增）
<meta name="apple-mobile-web-app-title" content="标题" />
//是否启用 WebApp 全屏模式
<meta name="apple-mobile-web-app-capable" content="yes" />
//设置状态栏的背景颜色,只有在 `"apple-mobile-web-app-capable" content="yes"`
时生效
<meta
	name="apple-mobile-web-app-status-bar-style"
	content="black-translucent"
/>
//禁止数字自动识别为电话号码
<meta name="format-detection" content="telephone=no" />
```

**9. rss 订阅**

```html
//添加RSS订阅
<link rel="alternate" type="application/rss+xml" title="RSS" href="/rss.xml" />
```

**10. favicon icon**

```html
//添加favicon icon
<link rel="shortcut icon" type="image/ico" href="/favicon.ico" />
```

**11. 移动端的 mate 优化**

```html
<meta
	name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no"
/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no, email=no" />
<meta
	name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no"
/>
<!-- 删除苹果默认的工具栏和菜单栏 -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 设置苹果工具栏颜色 -->
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<!-- 忽略页面中的数字识别为电话，忽略email识别 -->
<meta name="format-detection" content="telphone=no, email=no" />
<!-- 启用360浏览器的极速模式(webkit) -->
<meta name="renderer" content="webkit" />
<!-- 避免IE使用兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- 针对手持设备优化，主要是针对一些老的不识别viewport的浏览器，比如黑莓 -->
<meta name="HandheldFriendly" content="true" />
<!-- 微软的老式浏览器 -->
<meta name="MobileOptimized" content="320" />
<!-- uc强制竖屏 -->
<meta name="screen-orientation" content="portrait" />
<!-- QQ强制竖屏 -->
<meta name="x5-orientation" content="portrait" />
<!-- UC强制全屏 -->
<meta name="full-screen" content="yes" />
<!-- QQ强制全屏 -->
<meta name="x5-fullscreen" content="true" />
<!-- UC应用模式 -->
<meta name="browsermode" content="application" />
<!-- QQ应用模式 -->
<meta name="x5-page-mode" content="app" />
<!-- windows phone 点击无高光 -->
<meta name="msapplication-tap-highlight" content="no" />
```

#### 注意事项

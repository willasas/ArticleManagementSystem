## **可复用js总结**
#### 部分常用js
**1. 检测Internet Explorer版本**
``` @js
$(document).ready(function() {
      if (navigator.userAgent.match(/msie/i) ){
        alert('I am an old fashioned Internet Explorer');
      }
});
```

**2. 平稳滑动到页面顶部**
``` @js
$("a[href='#top']").click(function() {
  $("html, body").animate({ scrollTop: 0 }, "slow");
  return false;
});
```

**3. 固定在顶部**
``` @js
$(function(){
    var $win = $(window)
    var $nav = $('.mytoolbar');
    var navTop = $('.mytoolbar').length && $('.mytoolbar').offset().top;
    var isFixed=0;
    processScroll()
    $win.on('scroll', processScroll)
    function processScroll() {
    var i, scrollTop = $win.scrollTop()
    if (scrollTop >= navTop && !isFixed) {
        isFixed = 1
        $nav.addClass('subnav-fixed')
    } else if (scrollTop < = navTop && isFixed) {
        isFixed = 0
        $nav.removeClass('subnav-fixed')
    }
}
```

**4. 检测视窗宽度**
``` @js
var responsive_viewport = $(window).width();
/* if is below 481px */
if (responsive_viewport < 481) {
    alert('Viewport is smaller than 481px.');
}
```

**5. 自动定位并修复损坏图片**
``` @js
$('img').error(function(){
    $(this).attr('src', 'img/broken.png');
});
```

**6. 检测复制、粘贴和剪切的操作**
``` @js
$("#textA").bind('copy', function() {
    $('span').text('copy behaviour detected!')
});
$("#textA").bind('paste', function() {
    $('span').text('paste behaviour detected!')
});
$("#textA").bind('cut', function() {
    $('span').text('cut behaviour detected!')
});
```

**7. 遇到外部链接自动添加target=”blank”的属性**
``` @js
var root = location.protocol + '//' + location.host;
$('a').not(':contains(root)').click(function(){
    this.target = "_blank";
});
```

**8. 在图片上停留时淡出或淡入效果**
``` @js
$(document).ready(function() {
    $(".thumbs img").fadeTo("slow", 0.6); // This sets the opacity of the thumbs to fade down to 60% when the page loads
    $(".thumbs img").hover(function() {
        $(this).fadeTo("slow", 1.0); // This should set the opacity to 100% on hover
    },
    function() {
        $(this).fadeTo("slow", 0.6); // This should set the opacity back to 60% on mouseout
    });
});
```

**9. 在文本或密码输入时禁止空格键**
``` @js
$('input.nospace').keydown(function(e) {
    if (e.keyCode == 32) {
        return false;
    }
});
```

#### 注意事项
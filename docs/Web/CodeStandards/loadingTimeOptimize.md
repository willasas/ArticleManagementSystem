## **网页加载时间优化**
#### 准备工作
- [检测站点在全球各个地区加载时间](https://www.dotcom-tools.com/website-speed-test.aspx)
- [查询不同服务商的DNS lookup time](https://www.dnsperf.com/)
- [实时预加载](https://instant.page/)
- DNS相关知识
- CDN相关知识

#### 优化方向
**1. Connect Time and SSI Time**

- 一个是http网络连接用时，另一个是SSl协议用时，优化空间不大，pass。

**2. Request Time**

- 页面的静态化
- 开启服务端的gzip功能

**3. First Byte Time**

- 获取该数据所需的时间越长, 显示页面所需的时间就越长。
- CDN 更换
- 后端性能优化

**4. 实时预加载**

- 在用户单击链接之前，他们会将鼠标悬停在该链接上。当用户悬停了 65 ms 时，他们有机会单击该链接，因此 instant.page 此时开始预加载，页面平均超过 300 ms 才能预加载。

- 使用方法如下：

```html
<!--将此 HTML 片段放在 </body> 之前-->
<script src="//instant.page/5.1.0" type="module" integrity="sha384-by67kQnR+pyfy8yWP4kPO12fHKRLHZPfEsiSXR8u2IKcTdxD805MGUXBzVPnkLHw"></script>
```

#### 注意事项
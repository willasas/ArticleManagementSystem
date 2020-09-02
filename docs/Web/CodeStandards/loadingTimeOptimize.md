## **网页加载时间优化**
#### 准备工作
* [检测站点在全球各个地区加载时间](https://www.dotcom-tools.com/website-speed-test.aspx)
* [查询不同服务商的DNS lookup time](https://www.dnsperf.com/)
* DNS相关知识
* CDN相关知识

#### 优化方向
**1. Connect Time and SSI Time**
* 一个是http网络连接用时，另一个是SSl协议用时，优化空间不大，pass。

**2. Request Time**
* 页面的静态化
* 开启服务端的gzip功能

**3. First Byte Time**
* 获取该数据所需的时间越长, 显示页面所需的时间就越长。
* CDN 更换
* 后端性能优化

#### 注意事项
## **浏览器工作原理**

#### 计算机体系结构

- 硬件在底部，操作系统在中间，应用程序在顶部

**1. 进程与线程（Process And Thread）**

- 进程可以描述为应用程序的执行程序。线程存在于流程内部并执行其流程程序的任何部分的线程。
- 启动应用程序时，将创建一个线程。该程序可能会创建线程来帮助其工作，但这是可选的。操作系统为进程提供了一个平板的内存，所有应用程序状态都保留在该专用内存空间中。当您关闭程序时，该过程也会消失，并且操作系统会释放内存。
- 一个进程可以要求操作系统启动另一个进程来运行不同的任务。发生这种情况时，将为新进程分配内存的不同部分。如果两个进程需要通信，他们可以利用IPC（进程间通信）。许多应用程序都以这种方式工作，如果工作进程无响应，则可以重新启动它，而无需停止正在运行应用程序不同部分的其他进程。

**2. 浏览器架构**

- 进程/线程图中的不同浏览器架构

- Chrome的多进程架构图。在“渲染器进程”下显示了多个图层，以表示Chrome为每个选项卡运行了多个“渲染器进程”

- 指向浏览器UI不同部分的不同过程



**3. chrome中多进程架构的好处**

- 之前，我提到Chrome使用多个渲染器过程。在最简单的情况下，您可以想象每个选项卡都有其自己的渲染器过程。假设您有3个标签页处于打开状态，每个标签页均由独立的渲染器进程运行。如果一个选项卡变得无响应，则可以关闭无响应的选项卡并继续运行，同时保持其他选项卡的活动状态。如果所有选项卡都在一个进程上运行，则当一个选项卡无响应时，所有选项卡将无响应

- 运行每个选项卡的多个进程
- 由于进程具有自己的私有内存空间，因此它们通常包含通用基础结构的副本（例如V8，这是Chrome的JavaScript引擎）。这意味着更多的内存使用情况，因为如果它们是同一进程中的线程，将无法共享它们。为了节省内存，Chrome对可启动的进程数量进行了限制。该限制取决于设备拥有的内存和CPU能力，但是Chrome达到限制后，它将开始在同一过程中从同一站点运行多个标签页。

**4. Chrome中的服务化**

- Chrome正在进行架构整改，以此将浏览器程序的每个部分作为一项服务运行，从而可以轻松拆分为不同的进程或聚合为一个进程。
- 一般的想法是，当Chrome在功能强大的硬件上运行时，它可能会将每个服务拆分为不同的进程，从而提供更改的稳定性，但是在资源受限的设备上，Chrome会将服务整合到一个进程中，从而节省了内存。在此更改之前，已在类似Android平台上使用了类似的整合过程以减少内存使用量的方法。
- Chrome服务化示意图，将不同的服务移至多个进程和一个浏览器进程

**5. 站点隔离**

- 网站隔离时Chrome最近引入的功能，可为每个跨网站iframe运行单独的渲染器进程。我们一直在讨论每个标签模型一个渲染器进程。该进程允许跨站点Iframe在单个渲染器进程中运行，并在不同站点之间共享内存空间。在相同的渲染器进程中运行a.com和b.com似乎可以。同源策略时网络的核心安全模型；这样就可以确保一个站点未经同意就无法访问其他站点的数据。绕过此策略时安全攻击的主要目标。进程隔离是分离站点最有效的方法。从Chrome67开始，默认情况下在桌面上启用“网站隔离”，因此标签中的每个跨网站iframe都会获得一个单独的渲染器进程。
- 站点隔离图；指向网站内iframe的多个渲染器进程

- 启用站点隔离是一项多年的工程工作。站点隔离并不像分配不同的渲染器进程那么简单。他从根本上改变了iframe彼此交流的方式。在页面上打开具有在不同进程上运行的iframe的devtools一意味着devtools必须实施幕后工作才能使其无缝显示。即使运行简单的Ctrl + F在页面中查找单词，也意味着跨不同的渲染器进程进行搜索。


#### 导航栏变化

**1. 导航中会发生什么**

- 在浏览器中输入URL，然后浏览器从internet上获取数据并显示一个页面。在本文中，我们将重点介绍用户请求站点和浏览器准备呈现页面（也称为导航）的部分

**2. 从浏览器过程开始**

- 正如第一部分介绍那样，CPU,GPU,内存和多进程体系结构中，选项卡之外的所有内容都以浏览器进程进行处理。浏览器进程具有以下线程：UI线程（用于绘制浏览器和按钮输入字段），网络线程（用于处理网络堆栈以从Internet接收数据），存储线程（用于控制对文件的访问）等等。在地址栏中键入URL时，输入将由浏览器进程的UI线程处理。
- 顶部的浏览器UI，底部的UI，网路和存储线程的浏览器过程图

**3. 简单的导航**

- 由于脚本会阻塞页面其他资源的下载，因此推荐将所有 script 标签尽可能放到 body 标签的底部，以尽量减少对整个页面下载的影响。

**4. 1**

- 根据定义，在它们的作用域链中至少有三个对象：闭包变量、局部变量和全局变量。这些额外的对象将会导致其他的性能问题。

**5. 来**

- 使用 while 循环进行轮转来替代某些操作：

**6. 使**

- 此技

#### 注意事项

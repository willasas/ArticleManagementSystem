## **环境说明**
#### 准备工作

- 从HTTP报文的角度分析

## **基础介绍**
**1. w3school中比较GET与POST**

| 类名 | GET | POST | 
| ------ | ------ | ------ |
| 后退按钮/刷新 | 无害 | 数据会被重新提交（浏览器应该告知用户数据会被重新提交） |
| 书签 | 可收藏 | 不可收藏 |
| 缓存 | 能被缓存 | 不能缓存 |
| 编码类型 | application/x-www-form-urlencoded | application/x-www-form-urlencoded 或 multipart/form-data。为二进制数据使用多重编码 |
| 历史 | 参数保留在浏览器历史中 | 参数不会保存在浏览器历史中 |
| 对数据长度的限制 | 是的。当发送数据时，GET 方法向 URL 添加数据；URL 的长度是受限制的（URL 的最大长度是 2048 个字符） | 无限制 |
| 对数据类型的限制 | 只允许 ASCII 字符 | 没有限制。也允许二进制数据 |
| 安全性 | 与 POST 相比，GET 的安全性较差，因为所发送的数据是 URL 的一部分。在发送密码或其他敏感信息时绝不要使用 GET ！ | POST 比 GET 更安全，因为参数不会被保存在浏览器历史或 web 服务器日志中 |
| 可见性 | 数据在 URL 中对所有人都是可见的 | 数据不会显示在 URL 中 |

- 其他HTTP请求方法

| 方法 | 描述 |
| --- | --- |
| HEAD | 与 GET 相同，但只返回 HTTP 报头，不返回文档主体 |
| PUT | 上传指定的 URI 表示 |
| DELETE | 删除指定资源 |
| OPTIONS | 返回服务器支持的 HTTP 方法 |
| CONNECT | 把请求连接转换到透明的 TCP/IP 通道 |

- 所以从标准上来看，GET 和 POST 的区别如下：
  - GET 用于获取信息，是无副作用的，是幂等的，且可缓存
  - POST 用于修改服务器上的数据，有副作用，非幂等，不可缓存

**2. GET 和 POST 报文上的区别**

- GET 和 POST 方法没有实质区别，只是报文格式不同。
- GET 和 POST 只是 HTTP 协议中两种请求方式，而 HTTP 协议是基于 TCP/IP 的应用层协议，无论 GET 还是 POST，用的都是同一个传输层协议，所以在传输上，没有区别。

```
// 不带参数时，只有方法名不同
POST /uri HTTP/1.1 \r\n
GET /uri HTTP/1.1 \r\n
// 带参数时，GET 方法的参数应该放在 url 中，POST 方法参数应该放在 body 中
GET /index.php?name=xiaoming.c&age=20 HTTP/1.1
Host: localhost

POST /index.php HTTP/1.1
Host: localhost
Content-Type: application/x-www-form-urlencoded
​
name=xiaoming.c&age=20
```

**3. GET方法参数写法是否固定**

- 在约定中，我们的参数是写在 ? 后面，用 & 分割。
- 解析报文的过程是通过获取 TCP 数据，用正则等工具从数据中获取 Header 和 Body，从而提取参数。
- 我们可以自己约定参数的写法，只要服务端能够解释出来就行，一种比较流行的写法是 http://www.example.com/user/name/chengqm/age/22。

**4. POST 方法比 GET 方法安全吗**

- 从传输的角度来说，他们都是不安全的，因为 HTTP 在网络上是明文传输的，只要在网络节点上捉包，就能完整地获取数据报文。
- 要想安全传输，就只有加密，也就是 HTTPS

**5. GET 方法的长度限制是怎么回事**

- HTTP 协议没有 Body 和 URL 的长度限制，对 URL 限制的大多是浏览器和服务器的原因。
- 服务器是因为处理长 URL 要消耗比较多的资源，为了性能和安全（防止恶意构造长 URL 来攻击）考虑，会给 URL 长度加限制。

#### 注意事项

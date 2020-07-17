## **环境说明**

#### 准备工作

- go 语言环境
- [go-micro官网](https://github.com/micro/go-micro)

## **步骤说明**

**1. 下**

![目录结构](../../img/go_img/ms11.png)

**2. 打**

```@cmd
protoc --version
```

![查看安装结果](../../img/go_img/ms12.png)

**3. 安**


**4. 创建并编译 proto 文件**

- 生成.go文件

```@cmd
protoc -I . --micro_out=. --go_out=. ./filename.proto
```

**5. V**


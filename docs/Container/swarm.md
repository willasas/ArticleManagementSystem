## **环境说明**

#### 准备工作

- Windows 10 x64 专业版(版本 2004)
- 启用 Hyper-V 和容器 Windows 功能
- [vmwareworkstation 下载](https://www.virtualbox.org/wiki/Downloads)

## **原理**

- swarm 集群由管理节点（manager）和工作节点（work node）构成。
  - swarm mananger：负责整个集群的管理工作包括集群配置、服务管理等所有跟集群有关的工作。
  - work node：即图中的 available node，主要负责运行相应的服务来执行任务（task）

![services-diangram](..//img/ct_img/dk29.png)

## **步骤说明**

**1. 创建 swarm 集群管理节点（manager）**

```bash
docker-machine create -d virtualbox swarm-manager  #创建manager集群
docker-machine ssh swarm-manager   #进行初始化的这台机器
docker swarm init --advertise-addr 192.168.0.108 #这里的 IP 为创建机器时分配的 ip。
```

- 复制输出结果：

```
docker swarm join --token SWMTKN-1-4oogo9qziq768dma0uh3j0z0m5twlm10iynvz7ixza96k6jh9p-ajkb6w7qd06y1e33yrgko64sk 192.168.0.108:2377
```

**2. 创建 swarm 集群工作节点（worker）**

- 创建 swarm-worker1 和 swarm-worker2 节点

```bash
docker-machine create -d virtualbox swarm-worker1  #创建worker1节点
docker-machine create -d virtualbox swarm-worker1  #创建worker2节点
docker-marchine ls  #查看所有机器
# 分别给两个节点添加集群
docker-machine ssh swarm-worker1   #进行worker1节点
docker swarm join --token SWMTKN-1-4oogo9qziq768dma0uh3j0z0m5twlm10iynvz7ixza96k6jh9p-ajkb6w7qd06y1e33yrgko64sk 192.168.0.108:2377
docker-machine ssh swarm-worker2   #进行worker2节点
docker swarm join --token SWMTKN-1-4oogo9qziq768dma0uh3j0z0m5twlm10iynvz7ixza96k6jh9p-ajkb6w7qd06y1e33yrgko64sk 192.168.0.108:2377
```

**3. 查看集群信息**

```bash
docker-machine ssh swarm-worker1   #进入worker1或worker2节点
docker info   #查看集群信息
```

**4. 部署服务到集群中（以下操作均在管理节点下进行）**

```bash
docker-machine ssh swarm-manager   #进行管理节点manager
docker service create --replicas 1 --name helloworld alpine ping docker.com  #在一个工作节点上创建一个名为 helloworld 的服务，这里是随机指派给一个工作节点
```

**5. 查看服务部署情况**

```bash
docker service ps helloworld  #查看 helloworld 服务运行在哪个节点上
docker service inspect --pretty helloworld   #查看 helloworld 部署的具体信息
```

**6. 扩展集群服务**

```bash
docker service scale helloworld=2  #将helloworld 服务扩展到俩个节点
docker service ps helloworld   #查看
```

**7. 删除服务**

```bash
docker service rm helloworld  #删除helloworld服务
docker servvice ps helloworld   #查看是否已删除
```

**8. 滚动升级服务**

```bash
docker service create --replicas 1 --name redis --update-delay 10s redis:3.0.6  #创建一个 3.0.6 版本的 redis
docker service update --image redis:3.0.7 redis #滚动升级redis
docker service ps redis  #查看
```

**9. 停止某个节点接收新的任务**

```bash
docker node ls   #查看所有的节点，AVAILABILITY即为节点状态
docker node update --availability drain swarm-worker1  #停止节点 swarm-worker1，不会影响到集群的服务，只是 swarm-worker1 节点不再接收新的任务，集群的负载能力有所下降。
docker node ls   #查看
docker node update --availability active swarm-worker1  #重新激活节点
```

#### 注意事项

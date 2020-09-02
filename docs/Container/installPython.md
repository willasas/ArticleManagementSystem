## **环境说明**

#### 准备工作

- Windows 10 x64 专业版(版本 2004)
- Docker version 19.03.12, build 48a66213fe
- [Docker Hub](https://hub.docker.com/)
- [python 镜像库地址](https://hub.docker.com/_/python?tab=tags)

## **步骤说明**

**1. 访问 python 镜像库地址，可以通过 Sort by 查看其他版本的 python 。默认是最新版本 python:latest 。**

**2. 拉取最新版本的 python 镜像，这里我们拉去官方的 3.8 版本为例**

```cmd
docker search python   #查看python可用版本
docker pull python:3.8    #拉去3.8版本
docker images python:3.8  #查看本地镜像
```

**2.1 方法二、通过 Dockerfile 构建**

```
mkdir -p ~/python ~/python/app  #app目录将映射为 python 容器配置的应用目录
cd python  #进入python目录，创建Dockerfile
```

- Dockerfile 内容如下：

```Dockerfile
FROM buildpack-deps:jessie

# remove several traces of debian python
RUN apt-get purge -y python.*

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

# gpg: key F73C700D: public key "Larry Hastings <larry@hastings.org>" imported
ENV GPG_KEY 97FC712E4C024BBEA48A61ED3A5CA953F73C700D

ENV PYTHON_VERSION 3.8

# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 8.1.2

RUN set -ex \
        && curl -fSL "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" -o python.tar.xz \
        && curl -fSL "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" -o python.tar.xz.asc \
        && export GNUPGHOME="$(mktemp -d)" \
        && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$GPG_KEY" \
        && gpg --batch --verify python.tar.xz.asc python.tar.xz \
        && rm -r "$GNUPGHOME" python.tar.xz.asc \
        && mkdir -p /usr/src/python \
        && tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz \
        && rm python.tar.xz \
        \
        && cd /usr/src/python \
        && ./configure --enable-shared --enable-unicode=ucs4 \
        && make -j$(nproc) \
        && make install \
        && ldconfig \
        && pip3 install --no-cache-dir --upgrade --ignore-installed pip==$PYTHON_PIP_VERSION \
        && find /usr/local -depth \
                \( \
                    \( -type d -a -name test -o -name tests \) \
                    -o \
                    \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
                \) -exec rm -rf '{}' + \
        && rm -rf /usr/src/python ~/.cache

# make some useful symlinks that are expected to exist
RUN cd /usr/local/bin \
        && ln -s easy_install-3.5 easy_install \
        && ln -s idle3 idle \
        && ln -s pydoc3 pydoc \
        && ln -s python3 python \
        && ln -s python3-config python-config

CMD ["python3"]
```

- 通过 Dockerfile 创建一个镜像，替换成你自己的名字

```
docker build -t python:3.8 .
docker images python:3.8
```

**3. 使用 python 镜像**

- 在 ~/python/app 目录下创建一个 helloworld.py 文件，代码如下：

```helloworld.py
print("Hello, World!");
```

**4. 运行容器**

```cmd
docker run  -v $PWD/app:/usr/src/app  -w /usr/src/app python:3.8 python helloworld.py
```

- 参数说明：
  - -v \$PWD/app:/usr/src/app: 将主机中当前目录下的 app 挂载到容器的 /usr/src/app。
  - -w /usr/src/app: 指定容器的 /usr/src/app 目录为工作目录。
  - python helloworld.py: 使用容器的 python 命令来执行工作目录中的 helloworld.py 文件。

#### 注意事项

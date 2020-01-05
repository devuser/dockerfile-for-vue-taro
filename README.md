# dockerfile-for-vue-taro

Dockerfile for Vue developer or Taro developer

适用于在Docker环境下工作的前端工程师，增加 `Vue` & `Taro`的内容。

使用Docker环境开发的优势

1. 维护比较干净的开发环境
2. 维护多个版本的开发环境
3. 构建开发环境过程中需要翻墙，如果使用Docker环境开发的话，可以一人翻墙多人受益

本项目包括两个`Dockerfile`，

- 根目录下是全量版本，即从`node`基础版本开始构建
- `taro`目录下的增量版本，即从全量版本开始，构建升级新版本的`Taro`

## 构建镜像

构建镜像的命令

```shell
docker build --no-cache -t yourself/vue .
```

鼓励在当前目录下创建一个shell脚本，比如`build.sh`。

执行`./build.sh`构建全量版本即可。

日后使用可以在 `taro`目录下执行`./build.sh`构建增量版本。

注意事项：构建镜像时，可能因为缺少文件`config` `known_hosts` `authorized_keys`报错，
打开Dockerfile注释对应的语句，然后重新执行构建命令即可。

如果您也需要上述文件，手工创建两个空文件即可。

```shell
touch config
touch authorized_keys
touch known_hosts
```

## Usage

如下描述适用于`macOS` & `Linux`用户，

1. 启动Docker环境
2. 确保您通过各种技巧+技术可以正常访问海外网站，比亚马逊云（俗称翻墙）
3. 执行./build.sh，确认执行成功
4. 在 `Shell`窗口中执行`docker images`查询确认上述存在镜像`node/vuetaro`

编辑开发环境的`.bash_profile`增加如下别名定义

本人开发环境启动镜像`node/vuetaro`前，需要启动`Redis` 和`MySQL`。 如果您不需要的话，可以删除相关代码。

占有固定端口

```shell
alias vuezero="docker run -m 1024m --rm -it -v $HOME/working:/usr/src/myapp -w /usr/src/myapp --link some-redis --link some-mysql:mysql -p 48080:8080 node/vuetaro /bin/bash"
```

不占用端口

```shell
alias alphazero="docker run -m 2048m --rm -it -v $HOME/working:/usr/src/myapp -w /usr/src/myapp --link some-redis --link some-mysql:mysql node/vuetaro /bin/bash"
```

Hexo环境

```shell
alias hexozero="docker run -m 1024m --rm -it -v $HOME/working:/usr/src/myapp -w /usr/src/myapp --link some-redis --link some-mysql:mysql -p 44000:4000 node/vuetaro /bin/bash"
```

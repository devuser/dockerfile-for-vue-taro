# dockerfile-for-vue-taro
Dockerfile for vue developer or Taro developer

适用于在Docker环境下工作的前端工程师，增加 `Vue` & `Taro`的内容。

本项目包括两个`Dockerfile`，

- 根目录下是全量版本，即从`node`基础版本开始构建
- `taro`目录下的增量版本，即从全量版本开始，构建升级新版本的`Taro`

首次使用，在根目录下执行`./build.sh`构建全量版本即可。
日后使用可以在 `taro`目录下执行`./build.sh`构建增量版本。


## Usage

如下描述适用于`macOS` & `Linux`用户，
1. 启动Docker环境
2. 确保您通过各种技巧+技术可以正常访问海外网站，比亚马逊云（俗称翻墙） 
3. 执行./build.sh，确认执行成功
4. 在 `Shell`窗口中执行`docker images`查询确认上述存在镜像`xiehuanang/vue` 


编辑开发环境的`.bash_profile`增加如下别名定义

本人开发环境启动镜像`xiehuanang/vue`前，需要启动`Redis` 和`MySQL`。
如果您不需要的话，可以删除相关代码。

占有固定端口
```Shell
alias vuezero="docker run -m 1024m --rm -it -v $HOME/working:/usr/src/myapp -w /usr/src/myapp/bocpts-react-antd --link some-redis --link some-mysql:mysql -p 48080:8080 xiehuanang/vue /bin/bash"
```

不占用端口
```Shell
alias alphazero="docker run -m 2048m --rm -it -v $HOME/working:/usr/src/myapp -w /usr/src/myapp/tencentyun/gangxiaoer-mpvue-v3-unstable --link some-redis --link some-mysql:mysql xiehuanang/vue /bin/bash"

```

Hexo环境
```Shell
alias hexozero="docker run -m 1024m --rm -it -v $HOME/working:/usr/src/myapp -w /usr/src/myapp/pts-notes-hexo --link some-redis --link some-mysql:mysql -p 44000:4000 xiehuanang/vue /bin/bash"
```

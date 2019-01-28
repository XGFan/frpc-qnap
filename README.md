### frp qnap client

使用[QDK]( https://github.com/qnap-dev/QDK) 将[frp_0.23.2_linux_amd64](https://github.com/fatedier/frp/releases/)  简单的打包了一下。

```bash
# git clone https://github.com/XGFan/frpc-qnap.git
# cd frpc-qnap
# qbuild
```



当然了，我已经提前在build文件夹里放好了可用的版本。

安装之后启动会自动在`Web`目录下创建`frpc`文件夹，读取里面的`frpc.ini` ，运行日志则为同目录下的`frpc.log`。

> 这儿有个安全隐患，放在`web`下，内网可以直接下载配置文件和日志，内网嘛，安全自己负责好了。; )

所以第一次安装是跑不起来的，没有配置文件，当然，如果提前创建好配置文件就能正常启动了。修改配置文件之后需要手动停止和启用。

配置文件参见 [frpc](https://github.com/fatedier/frp) 。

暂时只支持X86_64，理论上也可以支持其他架构。但是我没有测试机器。



已知的问题：

+ Ubuntu的QDK打包的不能用，目测是QDK的问题。


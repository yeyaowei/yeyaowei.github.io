---
title: WSL 2 Shell 自动设置 HTTP 代理
date: 2020-05-09 11:22:00
tags:
---
在 WSL 2 上需要获取主机的 IP 地址来访问 Windows 系统上的服务器。
所以如果要设置代理的话，就得用这个 IP 加上对应端口来设置。
不过这个 IP 经常变化，每次都要自己手动获取去找然后 export 就很麻烦，有没有办法让 Shell 启动就设置好代理呢？
<!--more-->
## 如何自动获取所需 IP
这个 IP 可以通过查看 <code>/etc/resolve.conf</code> 文件，在 <code>nameserver</code> 后面的就是我们要的 IP 地址。
{% asset_img wsl2-network-l2w.png 图源 Microsoft Docs %}

了解之后我们很轻易就可以用一行命令获取相应 IP
<pre>
$ cat /etc/resolv.conf | grep 'nameserver' | awk '{print $2}'
192.168.96.193
</pre>

这样我们就可以在脚本里面自动获取所需的 IP 了。

## 脚本
没啥好说的，直接上代码...
<pre>
httpProxyPort='7890' # HTTP 代理端口
# socksProxyPort='7890' # SOCKS5 代理端口
hostIP=`cat /etc/resolv.conf | grep 'nameserver' | awk '{print $2}'` # 主机 IP

# echo Host Machine IP Address: $hostIP
# echo Auto Proxy Enabled

# 设置 HTTP/HTTPS 代理
export http_proxy='http://'$hostIP':'$httpProxyPort
export https_proxy='http://'$hostIP':'$httpProxyPort
# export all_proxy='socks5://'$hostIP':'$socksProxyPort # 设置 SOCKS5 代理
</pre>
写得很难看，我的水平就这样了呜呜呜...

## 然后写到 .bashrc 里面去
不一定是 <code>.bashrc</code> 啦，我这里用的是 ZSH，就加到 <code>.zshrc</code> 去了。
你可以直接在文件末尾加上那一大串代码，也可以把脚本保存在另一个文件，然后 <code>source</code> 一下。

## 结尾
没啦，是不是很水？💔
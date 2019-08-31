---
title: "在 Manjaro 上手动安装官网的 NVIDIA 显卡驱动"
date: 2019-01-16 17:16:04
updated: 2019-01-16 17:16:04
tags:
---
最近又瞎折腾... 把操作系统换成 Manjaro 了...
本来说是打算和 Windows 10 共存，但是安装的时候 EFI 分区被我瞎搞，然后进 Windows 也蓝屏了...
干脆抹除整个硬盘就只用 Manjaro 吧！
这次用的是 KDE 的桌面版本，发现还不错！比之前用过的 Deepin 和 GNOME 体验要好一些。
用着用着我就发现了一个问题，我的 HDMI 音频不见了。
在音频设置里面的确有看到 `GK106 HDMI Audio Controller` ，但是却没有 HDMI 输出配置。然后折腾来折腾去各种卸载安装无济于事。
于是我就在想是不是驱动的问题？然后我就把驱动换成了更老的 390 版本，果然！换到老版本之后就出现了 `Digital Stereo (HDMI 3) 输出` 的选项！
但是我想用最新的版本也... 平常安装显卡驱动都是系统自带的一些安装工具，那么如何自己上 NVIDIA 网站下载驱动并且安装呢？
<!--more-->
## 安装方法
### 下载驱动
首先上 [NVIDIA](https://www.nvidia.cn/Download/index.aspx?lang=cn) 官网下载自己的显卡驱动，操作系统选择 `Linux 64-bit`。
下载下来的文件应该是一个扩展名为 `.run` 的文件，将它存放至 `~/` 或者其他目录，不要放在中文目录下！
## 安装所需的前置
我们还需要安装开发工具以及内核头文件来编译驱动，首先是内核头文件，先检查自己的内核版本。
<pre>
$ uname-r
<b>4.19</b>.13-1-MANJARO
</pre>

我们需要安装的内核头文件则是 <code>linux<b>419</b>-headers</code>:

<pre>
$ sudo pacman -S linux419-headers
</pre>

接着安装开发工具，出现选项时直接按下 `回车键` 安装全部。

<pre>
$ sudo pacman -S base-devel dkms
</pre>

### 禁用 Nouveau 开源驱动
编辑 `/etc/default/grub` Grub 配置文件
将 `GRUB_CMDLINE_LINUX` 开头的那一行改为 `GRUB_CMDLINE_LINUX="nouveau.modeset=0"`。
完成之后需要更新 Grub 改变：

<pre>
$ sudo update-grub
</pre>

### 重启并开始安装

重启电脑
<pre>
$ sudo reboot

重启之后，由于没有显卡驱动的支持，可能会卡在 BIOS Logo 界面或者是黑屏。
这个时候你需要按下 <b>ALT + CTRL + F2</b> 进入到 TTY 文本模式。
</pre>

登录系统，开始安装驱动！

由于这里是纯文本模式，所以你并不可以打中文，这也是为什么要把驱动安装文件放在英文目录下的原因。

给予文件可执行权限并执行：
<pre>
$ chmod +777 NVIDIA-Linux-x86_64-410.93.run
$ sudo ./NVIDIA-Linux-x86_64-410.93.run
</pre>

安装的过程中遇到的选项全部 YES 就 OK 了！

然后就安装完毕啦！
接着重启系统就好了。
<pre>
$ sudo reboot
</pre>

### 完成
重启后你应该可以正常进入系统桌面了。我的 HDMI 音频输出也正常工作啦！
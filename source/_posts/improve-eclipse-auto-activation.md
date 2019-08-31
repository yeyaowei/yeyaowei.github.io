---
title: '让 Eclipse 在输入任何字母的时候都有补全提示'
date: 2019-01-15 14:38:14
updated: 2019-01-15 14:38:14
tags:
---
在用 Eclipse 编写 Java 代码的时候，总是觉得这个自动补全不是特别智能。像宇宙最强 IDE - Visual Studio 我敲一个字母它就会为我提示出可能的变量、类名称等等。而 Eclipse 的补全默认只发生在你在敲一个 `.` 的时候。那么既然我刚才说了「默认」，那么就一定可以修改这个选项hhh，下面就示范如何设置吧。
## 设置方法
转到 Eclipse 主界面，打开窗口顶部的菜单 `Window -> Preferences`
在弹出的窗口左侧的列表中，选择 `Java -> Editor -> Content Assist`
在右侧的 `Auto Activation` 那一栏中的 `Auto activation triggers for Java:`，填入：
```
ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.
```
这里包含了英语的所有大小写字母以及`.`，这样的话我们输入任何一个字母都可以弹出自动补全的提示了！
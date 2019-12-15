#!/bin/bash
set -ev
export TZ='Asia/Shanghai'

git config --global user.name "yeyaowei"
git config --global user.email "yeyaowei@gmail.com"

git clone -b master "git@github.com:yeyaowei/yeyaowei.github.io.git" .deploy_git

cd .deploy_git
git checkout master

mv .git/ ../public/

# 复制 Circle CI 配置到 master 分支
mkdir ../public/.circleci
cp ../.circleci/config.yml ../public/.circleci

cd ../public
git add .
git commit -m "更新: `date +"%Y-%m-%d %H:%M:%S"`"

# 推送
git push "git@github.com:yeyaowei/yeyaowei.github.io.git" master:master --force --quiet
# git push "git@yeyaowei.xyz:blog.git" master:master --force --quiet

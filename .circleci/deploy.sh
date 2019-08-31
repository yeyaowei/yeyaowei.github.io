#!/bin/bash
set -ev
export TZ='Asia/Shanghai'
git config --global user.name "yeyaowei"
git config --global user.email "yeyaowei@rhw-team.com"
# 先 clone 再 commit，避免直接 force commit
git clone -b master "git@github.com:yeyaowei/yeyaowei.github.io.git" .deploy_git

cd .deploy_git
git checkout master
mv .git/ ../public/
mkdir ../public/.circleci
cp ../.circleci/config.yml ../public/.circleci
cd ../public
git add .
git commit -m "更新: `date +"%Y-%m-%d %H:%M:%S"`"

# 推送
git push "git@github.com:yeyaowei/yeyaowei.github.io.git" master:master --force --quiet
# git push "git@yeyaowei.xyz:blog.git" master:master --force --quiet

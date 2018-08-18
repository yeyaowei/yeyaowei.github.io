#!/bin/bash
set -ev
export TZ='Asia/Shanghai'

# 先 clone 再 commit，避免直接 force commit
git clone -b master "https://${Travis}@github.com/yeyaowei/yeyaowei.github.io.git" .deploy_git

cd .deploy_git
git checkout master
mv .git/ ../public/
cd ../public

git add .
git commit -m "Site updated: `date +"%Y-%m-%d %H:%M:%S"`"

# 推送
git push "https://${Travis}@github.com/yeyaowei/yeyaowei.github.io.git" master:master --force --quiet
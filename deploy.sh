#!/bin/bash
set -ev
export TZ='Asia/Shanghai'

push_url="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}"

git clone -b master $push_url .deploy_git

cd .deploy_git
git checkout master

mv .git/ ../public/

cd ../public

git config --local user.name "github-actions"
git config --local user.email "github-actions@github.com"


git add .
git commit -m "更新: `date +"%Y-%m-%d %H:%M:%S"`"

# 推送
git push $push_url master:master --force --quiet

#!/usr/bin/env bash
set -e
git init
git add -A
git commit -m 'deploy'
git push -f https://@github.com/willasas/ArticleManagementSystem.git dev
cd -
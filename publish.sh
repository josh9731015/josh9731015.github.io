#!/bin/zsh
# 把作品頁從工作資料夾複製到發布資料夾（只複製要公開的 index.html，不含審查截圖與規格文件；hm-retail、ga4-funnel 兩頁），再推上 GitHub Pages
set -e
cd "$(dirname "$0")"
cp ../portfolio/hm-retail/index.html hm-retail/index.html
mkdir -p ga4-funnel
cp ../portfolio/ga4-funnel/index.html ga4-funnel/index.html
git add -A
git diff --cached --quiet && { echo "沒有變更"; exit 0; }
git commit -m "${1:-更新作品頁}"
git push

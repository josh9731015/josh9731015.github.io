#!/bin/zsh
# 把作品頁從工作資料夾複製到發布資料夾（只複製要公開的 index.html，不含審查截圖與規格文件；hm-retail（brief/ 只剩轉址頁）、ga4-funnel、olist-lakehouse），再推上 GitHub Pages
set -e
cd "$(dirname "$0")"
cp ../portfolio/hm-retail/index.html hm-retail/index.html
mkdir -p hm-retail/brief
cp ../portfolio/hm-retail/brief/index.html hm-retail/brief/index.html   # 舊主管簡報網址：2026-11-02 起改成轉到 ../（作品頁預設就是簡報），保留讓舊連結不壞
mkdir -p ga4-funnel
cp ../portfolio/ga4-funnel/index.html ga4-funnel/index.html
mkdir -p olist-lakehouse
cp ../portfolio/olist-lakehouse/index.html olist-lakehouse/index.html   # Databricks 湖倉作品頁（2026-10-14 新增）
mkdir -p olist-ai-assistant
cp ../portfolio/olist-ai-assistant/{index.html,shot-ask.jpg,shot-agent.jpg,slide-ask.jpg,slide-agent.jpg} olist-ai-assistant/   # AI 資料助理作品頁＋截圖（2026-10-23 新增；slide-* 是簡報模式用的裁切圖，2026-11-02）
git add -A
git diff --cached --quiet && { echo "沒有變更"; exit 0; }
git commit -m "${1:-更新作品頁}"
git push

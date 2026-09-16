@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo 同步最新页面...
copy /Y "亚马逊限价管理.html" "index.html" >nul

git add index.html "亚马逊限价管理.html" "限价管理-PRD.md" "分享链接.md"
git diff --cached --quiet
if %ERRORLEVEL% EQU 0 (
  echo 无变更，无需发布。
  goto :done
)

git commit -m "更新原型"
git push origin main

echo.
echo 发布成功！
echo 分享链接：https://li6286621-cell.github.io/amazon-price-limit-live/

:done
echo.
pause

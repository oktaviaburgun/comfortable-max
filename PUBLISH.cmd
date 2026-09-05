@echo off
title Publishing Letbe Grock
cd /d "%~dp0"
set "FB="
where firebase >nul 2>&1 && set "FB=firebase"
if not defined FB if exist "%APPDATA%\npm\firebase.cmd" set "FB=%APPDATA%\npm\firebase.cmd"
if not defined FB (
  echo.
  echo  ############################################################
  echo   The publishing tool is not installed.
  echo   Run SETUP-ONCE in the brokenheart-quest folder first.
  echo  ############################################################
  echo.
  pause
  exit /b 1
)
echo.
echo  Publishing your page to letbe-grock.web.app ...
echo.
call "%FB%" deploy --only hosting --project brokenheart-quest
echo.
echo  ==========================================================
echo   If you see "Deploy complete!" above, your page is live.
echo   https://letbe-grock.web.app
echo   Press Ctrl+F5 in your browser to see the new version.
echo.
echo   If you see an error instead, screenshot it for Claude.
echo  ==========================================================
echo.
pause

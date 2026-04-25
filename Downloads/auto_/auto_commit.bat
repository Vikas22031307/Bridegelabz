@echo off
cd /"C:\Users\vikas\Downloads\js_files"

git checkout backend

:: Get clean datetime using PowerShell
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set datetime=%%i

git add .
git diff --cached --quiet

if %errorlevel% neq 0 (
    git commit -m "Auto commit at %datetime%"
    git push origin backend
)
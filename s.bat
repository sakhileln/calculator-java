@echo off
setlocal enabledelayedexpansion

echo 🚀 Starting per-file Git commits...

REM Get list of modified and new files (excluding deleted)
for /f "tokens=*" %%F in ('git status --porcelain') do (
    set "line=%%F"
    set "status=!line:~0,2!"
    set "file=!line:~3!"

    REM Skip deleted files
    if not "!status!"==" D" (
        if exist "!file!" (
            call :get_label "!file!" label

            REM Build commit message
            set "msg=!label!: update !file!"

            REM Build and run command
            echo git add "!file!" && git commit -m "!msg!"
            git add "!file!" && git commit -m "!msg!"
        )
    )
)
goto :eof

:get_label
set "file=%~1"
set "label=chore"

REM Determine commit label based on file path
echo %file% | findstr /r "^src\\.*" >nul && set "label=feat"
echo %file% | findstr /r "^test\\.*" >nul && set "label=test"
if "%file%"=="Makefile" set "label=build"
if "%file%"=="Dockerfile" set "label=chore"
if "%file%"==".dockerignore" set "label=chore"
echo %file% | findstr /r "^.github\\workflows\\.*" >nul && set "label=ci"
if "%file%"=="README.md" set "label=docs"
echo %file% | findstr /r "^lib\\.*" >nul && set "label=chore"

set "%2=%label%"
goto :eof

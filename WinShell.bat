@echo off
title Shell
setlocal
color 1f
set "disallowed=echo on"
goto isAdmin

:welcome
echo ==========Welcome to WinShell Cmd==========
echo - To see new features - enter command "whatnew"
echo - Compile date: 21 November 2023 13:55
echo - Is Admin: %admin%
echo.
goto shell

:isAdmin
	net session >nul 2>&1
	if %errorLevel% == 0 (
		set "admin=True"
		set "prmpt=#"
		title WinShell - Admin
		goto welcome
	) else (
		title WinShell
		set "admin=False"
		set "prmpt=$"
		goto welcome
	)
	
:shell
set command=
echo [%cd%]%prmpt%
set /p "command=>"
if /i "%command%"=="|" (
	echo =============Error!=============
	echo - Piping allowed only for "command1|command2"
	echo.
	goto shell
)
if /i "%command%"=="||" (
        echo =============Error!=============
        echo - Piping allowed only for "command1||command2"
        echo.
        goto shell
)
if /i "%command%"==">" (
	echo =============Error!=============
	echo - ">" allowed only for "echo hi > file2" for overwrite or "echo hi >> file2" for adding
	echo.
	goto shell
)
if /i "%command%"=="<" (
	echo =============Error!=============
	echo - "<" allowed only for i don't know
	echo.
	goto shell
)
if /i "%command%"=="echo on" (
	echo =============Error!=============
	echo - Disallowed command!
	echo.
	goto shell
)
if /i "%command%"=="exit" (
	goto eof
)
if /i "%command%"=="end" (
	goto eof
)
if /i "%command%"=="isadmin" (
	echo Rights: %admin%
	echo.
	goto shell
)
if /i "%command%"=="help" (
	echo ====================================
	echo           WinShell Cmd Help
	echo ====================================
	echo All built-in commands of WinShell Cmd
	echo Some of them are Windows 7+ exclusive
	echo.
	echo - Help: Help page
	echo - IsAdmin:  Check administrator rights
	echo - Ver: Version of the Shell and system
	echo - Getcwd: get current directory
	echo - Blankfile: create a blank file
	echo - Randnum: get a random number
	echo - Hello: Hello world
	echo - Matrix: matrix effect
	echo - Whatnew: new in this version
	echo - Exit or end: exit shell. Proper WinShell exit
	echo - Debug_on: enable debug
	echo - Debug_off: disable debug
	echo - Verify_on: enable file write verification
	echo - Verify_off: disable file write verification
	echo - Windir: opens Windows system directory
	echo - Temp or tmp: open temp folder
	echo - Crash: crash system. You have some time to kill shell before BSoD
	echo To get Command Prompt help - enter "Help.exe"
	echo.
	echo =================Aliases================
	echo - Clear: clear screen. Alias to "cls"
	echo - Ls: lists content of directory. Alias to "dir"
	echo - Cmd: run Command prompt. Alias to "cmd.exe"
	echo - Powershell: run Powershell. Alias to "powershell.exe"
	echo - Suspend: suspend shell executing. Alias to "pause"
	echo.
	echo ============User rights mark============
	echo # - administrator rights
	echo $ - regular user rights
	echo.
	goto shell
)
if /i "%command%"=="ver" (
	echo ==========WinShell Cmd version 2.63==========
	echo - Creator: WinXP
	echo - Compile date: 21 November 2023 13:55
	echo - License: MIT public license
	echo Shell is incompatible with Windows 9x, NT lower Win2000 and Linux
	ver
	echo.
	goto shell
)
if /i "%command%"=="clear" (
	cls
	echo.
	goto shell
)
if /i "%command%"=="ls" (
	dir
	echo.
	goto shell
)
if /i "%command%"=="getcwd" (
	echo %cd%
	echo.
	goto shell
)
if /i "%command%"=="blankfile" (
	echo. > blank
	type blank > blank
	echo ==============Info==============
	echo - Blank file created!
	echo.
	goto shell
)
if /i "%command%"=="cmd" (
	echo ========Opening Cmd.exe=========
	start cmd
	exit
)
if /i "%command%"=="cmd.exe" (
	echo ========Opening Cmd.exe=========
	start cmd
	exit
)
if /i "%command%"=="powershell" (
	echo =====Opening Powershell.exe=====
	start powershell
	exit
)
if /i "%command%"=="powershell.exe" (
	echo =====Opening Powershell.exe=====
	start powershell
	exit
)
if /i "%command%"=="windir" (
	echo ======Opening %systemroot%======
	start %windir%
	echo.
	goto shell
)
if /i "%command%"=="temp" (
	echo ==========Opening %temp%========
	start %temp%
	echo.
	goto shell
)
if /i "%command%"=="tmp" (
	echo ==========Opening %temp%========
	start %temp%
	echo.
	goto shell
)
if /i "%command%"=="randnum" (
	echo Random number: %random%
	echo.
	goto shell
)
if /i "%command%"=="hello" (
	echo Hello, world!
	echo.
	goto shell
)
if /i "%command%"=="crash" (
	echo ========Crashing system=========
	echo - Info: You have some time to kill shell process before crashing system!
	ping localhost -n 8 >nul
	taskkill /f /im svchost.exe
	powershell wininit
	echo =============Error!=============
	echo - Unable to crash system
	echo.
	goto shell
)
if /i "%command%"=="matrix" (
	color 0a
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
	ping localhost -n 1 >nul
	pause
	color 1f
	echo.
	goto shell
)
if /i "%command%"=="debug_on" (
	prompt $g
	echo ==============Info==============
	echo - Debug enabled
	echo on
	goto shell
)
if /i "%command%"=="debug_off" (
	prompt $g
	echo ==============Info==============
	echo - Debug disabled
	echo off
	goto shell
)
if /i "%command%"=="verify_on" (
	verify on
	echo ==============Info==============
	echo - File writing verification enabled
	echo.
	goto shell
)
if /i "%command%"=="verify_off" (
	verify off
	echo ==============Info==============
	echo - File writing verification disabled
	echo.
	goto shell
)
if /i "%command%"=="suspend" (
	echo =============Pause==============
	pause
	echo.
	goto shell
)
if /i "%command%"=="whatnew" (
	echo ======New in this version=======
	echo - 1. Updated look a bit
	echo Good luck using WinShell 2.63!
	echo.
	goto shell
)
%command%
echo.
set command=
goto shell

:eof
echo =============Exiting=============
endlocal
@echo off
setlocal
color 1f
set "disallowed=echo on"
goto isAdmin

:welcome
echo ============WinShell lite============
echo.
goto shell

:isAdmin
	net session >nul 2>&1
	if %errorLevel% == 0 (
		set "admin=True"
		set "prmpt=#"
		goto welcome
	) else (
		set "admin=False"
		set "prmpt=$"
		goto welcome
	)
	
:shell
set command=
echo %cd%%prmpt%
set /p "command=>"
if /i "%command%"=="|" (
	goto shell
)
if /i "%command%"==">" (
	goto shell
)
if /i "%command%"=="<" (
	goto shell
)
if /i "%command%"=="exit" (
	goto eof
)
if /i "%command%"=="echo on" (
	echo.
	goto shell
)
if /i "%command%"=="isadmin" (
	echo %admin%
	echo.
	goto shell
)
if /i "%command%"=="help" (
	echo Help - Help page
	echo IsAdmin - Check administrator rights
	echo Ver - version of Shell and system
	echo Blankfile - create a blank file
	echo Exit - exit shell
	echo Whatnew - new in this version
	echo Debug_on - enable debug
	echo Debug_off - disable debug
	echo Verify_on - enable file write verification
	echo Verify_off - disable file write verification
	echo Temp or tmp - open temp folder
	echo.
	goto shell
)
if /i "%command%"=="ver" (
	echo WinShell lite 1.0. Based on WinShell 2.57 full
	ver
	echo.
	goto shell
)
if /i "%command%"=="blankfile" (
	echo. > blank
	type blank > blank
	echo Blank file created
	echo.
	goto shell
)
if /i "%command%"=="cmd" (
	start cmd
	exit
)
if /i "%command%"=="cmd.exe" (
	start cmd
	exit
)
if /i "%command%"=="powershell" (
	start powershell
	exit
)
if /i "%command%"=="powershell.exe" (
	start powershell
	exit
)
if /i "%command%"=="debug_on" (
	prompt $g
	echo Debug enabled
	echo on
	goto shell
)
if /i "%command%"=="debug_off" (
	prompt $g
	echo Debug disabled
	echo off
	goto shell
)
if /i "%command%"=="verify_on" (
	verify on
	echo File writing verification enabled
	echo.
	goto shell
)
if /i "%command%"=="verify_off" (
	verify off
	echo File writing verification disabled
	echo.
	goto shell
)
if /i "%command%"=="temp" (
	start %temp%
	echo.
	goto shell
)
if /i "%command%"=="tmp" (
	start %temp%
	echo.
	goto shell
)
if /i "%command%"=="whatnew" (
	echo New in this version:
	echo 1. Added commands - temp, tmp
	echo Good luck using WinShell lite v1.02!
	echo.
	goto shell
)
%command%
echo.
set command=
goto shell

:eof
echo Exiting
endlocal
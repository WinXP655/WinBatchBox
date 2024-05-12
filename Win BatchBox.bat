@echo off
setlocal enabledelayedexpansion
goto isAdmin

:welcome
echo Win BatchBox End of life release
echo Is Admin: %admin%
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
set /p "command=%cd%%prmpt%"
if /i "%command%"=="exit" goto eof
if /I "%command%" == "isadmin" (
	echo Rights: %admin%
	echo.
	goto shell
)
if /i "%command%"=="help" (
	echo Help: Help page
	echo IsAdmin:  Check administrator rights
	echo Ver: Version of the Shell and system
	echo Exit: exit shell. Proper exit
	echo whatnew: what is new in this version
	echo.
	echo User rights
	echo # - administrator rights
	echo $ - regular user rights
	echo.
	goto shell
)
if /i "%command%"=="ver" (
	echo Win BatchBox End-of-Life release
	echo Creator: WinXP655
	echo License: MIT public license
	echo Download last version: no future versions because of End-of-Life
	ver
	echo.
	goto shell
)
if /i "%command%"=="whatnew" (
	echo What's new
	echo 0. No new features because of End-of-Life
	echo.
	goto shell
)

%command%
echo.
set command=
goto shell

:eof
endlocal
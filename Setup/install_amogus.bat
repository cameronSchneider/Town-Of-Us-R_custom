@echo off

set STEAM_LOC=%~2

if not exist "%STEAM_LOC%" (
	EXIT 1
)

if not exist "%~dp0..\%1" (
	powershell -WindowStyle hidden -command "Expand-Archive -Force '%~dp0%1.zip' '%~dp0../'"
)

if not exist "%STEAM_LOC%\Among Us - ToU" (
	if exist "%STEAM_LOC%\Among Us" (
			
		mkdir "%STEAM_LOC%\Among Us - ToU"
		robocopy "%STEAM_LOC%\Among Us" "%STEAM_LOC%\Among Us - ToU" /E
			
		robocopy "%1" "%STEAM_LOC%\Among Us - ToU" /E
			
	) else (
		EXIT 2
	)
) else (
	echo Town of Us already installed!
)

EXIT 0

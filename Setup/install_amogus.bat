@echo on

set "DEFAULT_STEAM_LOC=%ProgramFiles(x86)%\Steam\steamapps\common"

if not exist "%DEFAULT_STEAM_LOC%" (
	EXIT 1
)

if not exist "%~dp0..\%1" (
	powershell -WindowStyle hidden -command "Expand-Archive -Force '%~dp0%1.zip' '%~dp0../'"
)

if not exist "%DEFAULT_STEAM_LOC%\Among Us - ToU" (
	if exist "%DEFAULT_STEAM_LOC%\Among Us" (
			
		mkdir "%DEFAULT_STEAM_LOC%\Among Us - ToU"
		robocopy "%DEFAULT_STEAM_LOC%\Among Us" "%DEFAULT_STEAM_LOC%\Among Us - ToU" /E
			
		robocopy "%1" "%DEFAULT_STEAM_LOC%\Among Us - ToU" /E
			
	) else (
		EXIT 2
	)
) else (
	echo Town of Us already installed!
)

EXIT 0

@echo off
@setLocal EnableDelayedExpansion

set TOU_VERSION=ToU.v3.2.0-surge
set BCL_VERSION=3.0.3
set STEAM=%ProgramFiles(x86)%\Stea

if not exist BetterCrewLink (
	mkdir BetterCrewLink
)

echo Installing proximity chat (BetterCrewLink)...
start /w /min "" "Setup\install_proximity.bat" %BCL_VERSION%
echo Done!

echo ................
echo ................

echo Installing Town of Us mod...

call :installAmogus

echo Done!

:doExit
	timeout 10
	EXIT

:installAmogus
	start /w "" Setup\install_amogus.bat %TOU_VERSION% "%STEAM%\steamapps\common"
	call :checkResult

:checkResult
	if %ERRORLEVEL% EQU 1 (
		echo "Could not find Steam at default location, please enter yours like C:\Program Files (x86)\Steam:"
		set /p "STEAM=>"
	
		call :installAmogus
	)

	if %ERRORLEVEL% EQU 2 (
		echo Install Among Us through Steam first!
		call :doExit
	)

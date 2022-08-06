@echo off

set TOU_VERSION=ToU.v3.2.0-surge
set BCL_VERSION=3.0.3

if not exist BetterCrewLink (
	mkdir BetterCrewLink
)

echo Installing proximity chat (BetterCrewLink)...
start /w /min "" "Setup\install_proximity.bat" %BCL_VERSION%
echo Done!

echo ................
echo ................

echo Installing Town of Us mod...

start /w "" "Setup\install_amogus.bat" %TOU_VERSION%

if %ERRORLEVEL% EQU 1 (
	echo Could not find Steam at default location.
	call :doExit
)

if %%ERRORLEVEL% EQU 2 (
	echo Install Among Us through Steam first!
	call :doExit
)

echo Done!

:doExit
	timeout 10
	EXIT

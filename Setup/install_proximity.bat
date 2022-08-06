@echo off
Setlocal EnableDelayedExpansion

if not exist "BetterCrewLink/BetterCrewLinkSetup-%1.exe" (
	curl --location --request GET https://github.com/OhMyGuus/BetterCrewLink/releases/download/v%1/Better-CrewLink-Setup-%1.exe --output BetterCrewLink/BetterCrewLinkSetup-%1.exe
	start /w "" "BetterCrewLink/BetterCrewLinkSetup-%1.exe"
)

EXIT
@echo off
setlocal

:: Variables - Change these
set "targetLocation=D:\Libraries\Documents\Guild Wars 2\addons\blishhud\markers"
set "fileName=dungeon_skips"

:: Delete old TacO file at target location
if exist "%targetLocation%\%fileName%.taco" (
    del /F "%targetLocation%\%fileName%.taco"
)

:: Build the TacO file
powershell -NoProfile -Command "Get-ChildItem -Recurse .\* | Where-Object { $_.FullName -notmatch '.git' -and $_.FullName -notmatch '.github' -and $_.Name -ne 'install.bat' } | Compress-Archive -DestinationPath .\%fileName%.zip -Force"
rename %fileName%.zip %fileName%.taco

:: Move the TacO file to the target location
move /Y "%fileName%.taco" "%targetLocation%"

endlocal

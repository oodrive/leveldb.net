@echo off

if "%1" == "" goto Error

nuget.exe pack LevelDB.Standard.nuspec -OutputDirectory Package -Version %1

goto End

:Error
echo Missing version number

:End
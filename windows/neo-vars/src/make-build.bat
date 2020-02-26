@echo off

echo Setting default local path variables
set  ahkpath=C:\Program Files\AutoHotkey

if exist _local_paths.bat call _local_paths.bat

set  Ahk2Exe=%ahkpath%\Compiler\Ahk2Exe.exe

REM The path to the authohotkey directory in the local svn copy, MUST be "."
set srcdir=.
set outdir=..\out
set Ssrcdir=%srcdir%\source
set ahkrevtemplate1=%Ssrcdir%\_subwcrev1.tmpl.ahk
set   ahkrevoutput1=%Ssrcdir%\_subwcrev1.generated.ahk
set batrevtemplate1=%Ssrcdir%\_subwcrev1.tmpl.bat
set   batrevoutput1=%Ssrcdir%\_subwcrev1.bat

set     NEO2AppData=%APPDATA%\NEO2
set       customahk=%NEO2AppData%\custom.ahk
set  customahkbuild=%customahk%.buildtmp

set fnexe=%outdir%\neo20.exe

echo removing old version(s) of NEO AHK Exe file
del "%outdir%\neo20-r*.exe" 2> nul

set fnahk=%srcdir%\neo20-all.ahk

if exist "%customahk%" (
  move "%customahk%" "%customahkbuild%"
)

echo Compiling the new Driver using Autohotkey
"%Ahk2Exe%" /in "%fnahk%" /out "%fnexe%" /icon "%srcdir%\neo_enabled.ico"

if exist "%customahkbuild%" (
  move "%customahkbuild%" "%customahk%"
)

echo Driver Update complete! You can now close this log-window.
pause

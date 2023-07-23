@echo off
rem This Function Convert the pasted name to it's hex value as the profile need
rem this value to form correctly. 
:str2hex
       goto :Setup
       :Convert
          setlocal EnableDelayedExpansion
             set /P "=%~1" < NUL > chr.tmp
             for %%a in (chr.tmp) do fsutil file createnew zero.tmp %%~Za > NUL
             set hex=
             for /F "skip=1 tokens=2" %%a in ('fc /B chr.tmp zero.tmp') do set "hex=!hex!%%a"
             del chr.tmp zero.tmp
             endlocal & set "%~1=%hex%" & SET "hex=%hex%"
             goto :eof
      
       :Setup
             echo.
             echo.
             set /p SNN=Paste Here :
             call :Convert "%SNN%"

             
rem this part is for testing only and not part of the main script. 
:Testing
    echo Name is   : %SNN%
    echo Hex Value : %hex%

    goto :eof
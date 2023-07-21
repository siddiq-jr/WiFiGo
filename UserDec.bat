@echo off 
setlocal
    cls
    echo ##################################################################
    echo ###                                                            ###
    echo ###                   Custom Dictinary Mode                    ###
    echo ###                                                            ###
    echo ##################################################################
    echo.
    echo.     
    echo.
    echo.
    echo        Please Locate Your Dictinary And Paste The Path Below
    echo.
    echo        Ex.  "C:\Users\UserProfile\Desktop\Wordlist.txt"
    echo.
    echo.
    echo.
    echo Paste The Path Within double Quotes [ " " ]
    echo.
    goto :User_Path_Input
    :User_Path_Input
            set /p UserPath=Paste Here :
       cls
       echo ##################################################################
       echo ###                                                            ###
       echo ###                   Custom Dictinary Mode                    ###
       echo ###                                                            ###
       echo ##################################################################
       echo.
       echo.     
       echo.
       echo.
       echo                Checking Validity, Please Wait ...

          goto :Check_If_Quit
    :Check_If_Quit 
       if "%UserPath%"=="q" (
             goto :End
       ) else (
           goto :Check_quit_Upper
       )
       :Check_quit_Upper 
       if "%UserPath%"=="Q" ( 
               goto :End
       ) else (
          goto :User_Dec_Check
       )

    :User_Dec_Check
       type %UserPath% | find /v /c "~" >count.tmp
       set /p cnt=<count.tmp
       del count.tmp
       if "%cnt%"=="0" (
             cls
             echo ##################################################################
             echo ###                                                            ###
             echo ###                   Custom Dictinary Mode                    ###
             echo ###                                                            ###
             echo ##################################################################
             echo.
             echo.     
             echo.
             echo.
             echo                        Checking Complete
             echo.
             echo                !! The Path Spesified is invalid !!
             echo.
             echo                Please Check The Path And Try Again
             echo.
             echo                     Or Type " Q / q " To Quit
             echo.
             goto :User_Path_Input
       ) else (
             cls
             echo ##################################################################
             echo ###                                                            ###
             echo ###                   Custom Dictinary Mode                    ###
             echo ###                                                            ###
             echo ##################################################################
             echo.
             echo.     
             echo.
             echo.
             echo                        Checking Complete
             echo.
             echo                        Cout :    %cnt%    
             echo.
             echo                      Thank You For Waiting
             echo.
                   timeout /t 2 /nobreak >nul
             set wordlist=%UserPath%
             goto :main
       )
endlocal  

:main
rem Tis Part Is Just To Test This Script Its Not a Part of The Main Script
echo pass
echo Path is : %UserPath%
goto :eof
:End
echo Bay bay

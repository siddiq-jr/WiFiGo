@echo off
:: This Script will Find Available Networks in range and Ask you ti select form.
:Scan_Networks
    setlocal
    rem This Is a Freindly User Interface 
    cls
    echo ##################################################################
    echo ###                                                            ###
    echo ###                      Scanning Done !                       ###
    echo ###                                                            ###
    echo ##################################################################
    echo.
    echo           ! Copy and Paste The Selected Network Name !
    echo.
    rem This command will find Networks and Cut Network Name and Show it as a list,
    rem and after pasteing the name takes you to Create Profile Function.
        netsh wlan show networks | find /c "SSID" > cou.tmp
        set /p n=<cou.tmp
        if "%n%"=="0" (
           del cou.tmp
           goto :Brake
        ) else (
        echo Networks Available :
        echo.
             FOR /F "Tokens=2 delims=:" %%i in ('netsh wlan show networks ^| find "SSID"') do (
                 echo Name = %%i
             ) 
        )
    echo.
    echo *****************************************************************
    echo.
    echo           ! Copy and Paste The Selected Network Name !
    echo.
    echo.
    echo -----------------------------------------------------------------
    echo To Copy  : Hilight The Name and " Ctr + C ".
    echo To Paste : Click Right Mouse Butten "Options Btn".
    echo -----------------------------------------------------------------
    echo.
       goto :Create_Profile
    rem Brake Function runs if there are no Networks in Range.
    :Brake
       cls
    echo ##################################################################
    echo ###                                                            ###
    echo ###      No Network In Range, OR Adapter is Powered Down       ###
    echo ###                                                            ###
    echo ##################################################################
    echo.
    echo.
    echo.
    echo.
    echo         Check Your Wireless Network Adapter and Try Again
    echo       If It Didin't Work,  No Wireless Network are in Range
       goto :End
    endlocal

:Create_Profile
    echo Pass
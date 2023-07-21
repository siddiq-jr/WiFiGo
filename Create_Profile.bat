@echo off
setlocal
set SNN=SIDDIQ JR
set Net_pass=12345678
set hex =534944444951204A52
set SNN2="%SNN%"

:Create_profile
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
echo 				 ^<keyMaterial^>%Net_pass%^</keyMaterial^>>> WiFi-%SNN2%.xml
echo 			 ^</sharedKey^>>> WiFi-%SNN2%.xml
echo 		 ^</security^>>> WiFi-%SNN2%.xml
echo 	 ^</MSM^>>> WiFi-%SNN2%.xml
echo 	 ^<MacRandomization xmlns="http://www.microsoft.com/networking/WLAN/profile/v3"^>>> WiFi-%SNN2%.xml
echo 		 ^<enableRandomization^>false^</enableRandomization^>>> WiFi-%SNN2%.xml
echo  	 ^</MacRandomization^>>> WiFi-%SNN2%.xml
echo ^</WLANProfile^>>> WiFi-%SNN2%.xml

endlocal
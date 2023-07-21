@echo off 
:: for now it will itirate over all networks 
:: available and append them to a list of names
:: 

setlocal
:: get_net_list will get a list of available network names
:Get_Net_List
    echo Networks are : > names.txt
    netsh wlan show networks | find "SSID" > Networks.txt
    FOR /F "eol=      tokens=2,3* delims=:" %%i in (Networks.txt) do (
       echo %%i >> names.txt
    ) 

:var
    type names.txt
    
endlocal
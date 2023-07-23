@echo off 
:: This Script just To Generate a temp File of a Wordlist in the Temp Folder 
:: And FeedBack a path, and Using That to in the Broutforce Function 
setlocal
 for /d %%i in (11111111,22222222,33333333,44444444,55555555,66666666,77777777,88888888,99999999,00000000,12345678,87654321,1234567890,0987654321,123456789,987654321,qqqqqqqq,wwwwwwww,eeeeeeee,rrrrrrrr,tttttttt,yyyyyyyy,uuuuuuuu,iiiiiiii,oooooooo,pppppppp,aaaaaaaa,ssssssss,dddddddd,ffffffff,gggggggg,hhhhhhhh,jjjjjjjj,kkkkkkkk,llllllll,zzzzzzzz,xxxxxxxx,cccccccc,vvvvvvvv,bbbbbbbb,nnnnnnnn,mmmmmmmm,Qqqqqqqq,Wwwwwwww,Eeeeeeee,Rrrrrrrr,Tttttttt,Yyyyyyyy,Uuuuuuuu,Iiiiiiii,Oooooooo,Pppppppp,Aaaaaaaa,Ssssssss,Dddddddd,Ffffffff,Gggggggg,Hhhhhhhh,Jjjjjjjj,Kkkkkkkk,Llllllll,Zzzzzzzz,Xxxxxxxx,Cccccccc,Vvvvvvvv,Bbbbbbbb,Nnnnnnnn,Mmmmmmmm,1111111111,2222222222,3333333333,4444444444,5555555555,6666666666,7777777777,8888888888,9999999999,0000000000,111111111,222222222,333333333,444444444,555555555,666666666,777777777,888888888,999999999,000000000,0917964004,095513388,12121212,23232323,34343434,45454545,56565656,67676767,78787878,89898989,10101010,09090909,98989898,87878787,76767676,65656565,54545454,43434343,32323232,21212121,1212121212,2323232323,3434343434,4545454545,5656565656,6767676767,7878787878,8989898989,9090909090,1010101010,0909090909,9898989898,8787878787,7676767676,6565656565,5454545454,4343434343,3232323232,2121212121,sabryglaxy,AndroidAP,Galaxy_A02D66F,Galaxy-A02D66F,GalaxyA02D66F,galaxya02D66f,Galaxya02D66f,Password,Pa$$word,Pa$w0rd,Pa$$w0rd,Pa$$W0rd,PA$$W0RD,My_Password,My_P@$$w0rd,my-password,mypassword,password) do (
    echo %%i >> TMP\Wordlist\Builtin.tmp
 )
 echo.
 echo Built-In WordList Is Generated Succesfully !
 echo.
 :: This Part Is For Test Only And Not Part Of The Script
 echo __________________________________________________
 type TMP\Wordlist\Builtin.tmp

endlocal

@echo off
:: This Script Loops Throw Word List and Delete the first word after checking it
:: to condetion in every iteration Amazing !! and Stops if No Match Found !!
setlocal
    :loop
        for /f %%i in (c:\users\siddiq-jr\desktop\TMP\temp.txt) do (
           echo  Testing : %%i
           set tmp_variable=%%i
           set pass=%%i
           more +1 "c:\users\siddiq-jr\desktop\TMP\temp.txt" > "c:\users\siddiq-jr\desktop\TMP\SUB\temp.txt"
           del c:\users\siddiq-jr\desktop\TMP\temp.txt
           move c:\users\siddiq-jr\desktop\TMP\SUB\temp.txt c:\users\siddiq-jr\desktop\TMP\temp.txt>nul
           goto :Condetion
        )
endlocal
    :Condetion
       type c:\users\siddiq-jr\desktop\TMP\temp.txt | find /v /c "~" >count.tmp
       set /p cnt=<count.tmp
       echo is %cnt%
       del count.tmp
       if "%cnt%"=="1" (
          echo No Match Found !!
         goto :eof
       ) else (
          goto :Statment
       )
       :Statment
          if "%tmp_variable%"=="rayoma" (
             echo Done %tmp_variable%
             echo pass is : %pass%
          ) else (
             goto :loop
          )
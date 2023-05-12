Here is my new version, I just want to add to the start, a check for if $1 is == to "task" then to goto :payload after shifting "task" out of the command, or to otherwise go to :payloadvar. 


```
@echo off
rem Get the first argument from the command line.set arg=%*
rem Create a temporary file.echo "" > C:\Users\danedens\bin\tempfile
rem Replace "recognize" with the first argument in the payload and output to the temp file.sed -e "s/TEMP/%arg%/g" C:\Users\danedens\bin\payloadvar.txt > C:\Users\danedens\bin\tempfile
rem Copy the contents of the temporary file to the clipboard.cat C:\Users\danedens\bin\tempfile | clip
rem Delete the temporary file.del C:\Users\danedens\bin\tempfile
rem Exit the batch script.exit /b
```
Bard > 
Sure, here is the updated batch script that you can use:

```
@echo off

rem Get the first argument from the command line.
set arg=%*

rem Check if the first argument is equal to "task".
if "%1" == "task" (
  rem Shift the first argument off the command line.
  shift

  rem Go to the "payload" label.
  goto :payload
) else (
  rem Go to the "payloadvar" label.
  goto :payloadvar
)

:payload
rem Replace "recognize" with the first argument in the payload and output to the temp file.
sed -e "s/TEMP/%arg%/g" C:\Users\danedens\bin\payload.txt > C:\Users\danedens\bin\tempfile
goto:eof

:payloadvar
rem Replace "recognize" with the first argument in the payload and output to the temp file.
sed -e "s/TEMP/%arg%/g" C:\Users\danedens\bin\payloadvar.txt > C:\Users\danedens\bin\tempfile
goto:eof

:eof
rem Copy the contents of the temporary file to the clipboard.
cat C:\Users\danedens\bin\tempfile | clip

rem Delete the temporary file.
del C:\Users\danedens\bin\tempfile

rem Exit the batch script.
exit /b
```


To use this batch script, save it as inject.cmd in a directory that is in your PATH environment variable. Then, you can run it from the command line by typing inject.cmd <arg>, where <arg> is the text that you want to replace "recognize" with.

For example, if you run the following command:

```
inject.cmd task hello
```

  The contents of the payload.txt file will be replaced with the following:

```
var=:=Task hello
```

If you run the following command:

```
inject.cmd hello
```

  
  
  
  
  
  
  
  
  
  

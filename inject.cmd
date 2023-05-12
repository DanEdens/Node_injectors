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
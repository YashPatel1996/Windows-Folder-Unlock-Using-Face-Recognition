@ECHO OFF

title Folder Locker

if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK

if NOT EXIST Locker goto MDLOCKER

:CONFIRM

echo Are you sure u want to Lock the folder(Y/N)

set/p "cho=>"

if %cho%==Y goto LOCK

if %cho%==y goto LOCK

if %cho%==n goto END

if %cho%==N goto END

echo Invalid choice.

goto CONFIRM

:LOCK

ren Locker "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

echo Folder locked

goto End

:UNLOCK

echo Enter password to Unlock folder
C:\ProgramData\Anaconda3\python.exe "F:\Projects & Internship\Fusion R&D\Yash_branch\Face Recognition\Face recognition.py" > Output
SET /p MYVAR=<Output
if %MYVAR%==yash goto DONE
for /f "tokens=*" %%a in (Output) do (
  if %%a==yash goto DONE
)
goto FAIL

:DONE
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Locker

echo Folder Unlocked successfully
pause

goto End

:FAIL
pause
echo Invalid password

goto end

:MDLOCKER

md Locker

echo Locker created successfully

goto End

:End
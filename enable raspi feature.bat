@echo off
Mode con cols=98 lines=10 & Color 9E
Title Searching the Drive letter of your USB Key by @binesheb
echo.
ECHO   *******************************************************************************************
echo.
echo                           Searching the drive letter of your USB Key .......
echo.
ECHO   *******************************************************************************************
wmic logicaldisk get DeviceID,DriveType /Format:CSV > %Tmp%\tmp.txt 
for /f "skip=2 tokens=1-3 delims=," %%a in ('%COMSPEC% /a /c type "%Tmp%\tmp.txt"') do echo %%b %%c >> %Tmp%\tmp2.txt
for /f "tokens=1" %%i in ('%COMSPEC% /a /c type "%Tmp%\tmp2.txt" ^|Find "2"') Do (set MyUSBDrive=%%i)
Del %Tmp%\tmp.txt & Del %Tmp%\tmp2.txt
cls
echo.
ECHO   *******************************************************************************************
echo.
echo                          The drive letter of your USB Key is  %MyUSBDrive%
echo.
ECHO   *******************************************************************************************
pause
cls
echo.
echo.
ECHO   *******************************************************************************************
echo.
echo      Press a button to delete infected shortcuts and restore hidden files in your USB key
echo.
ECHO   *******************************************************************************************
pause>nul
cls
echo.
echo.
ECHO   *******************************************************************************************
echo.
echo         Deleting infected shortcuts and restoring hidden files and enabling SSH on raspi
echo.
ECHO   *******************************************************************************************
:: To Unhide Folders and files into your USB key
Attrib -s -h -r %MyUSBDrive%\*.* /D /S >nul 2>&1
:: To delete all infected files.lnk
Del %MyUSBDrive%\*.lnk >nul 2>&1
copy .\asset\*.* %MyUSBDrive%\
pause
Explorer %MyUSBDrive%

@echo off
color F2
mode con: cols=70 lines=45
cd data
del model.txt
cls
echo.
echo                  Waiting adb Connection
echo.
adb wait-for-device
cls
adb shell getprop ro.product.model > model.txt
for /F "usebackq delims=" %%i in (model.txt) do md "%USERPROFILE%/Desktop/%%i"
cls
echo.           
echo                  Coping User DATA by TTA
echo.    
for /F "usebackq delims=" %%i in (model.txt) do adb pull sdcard/DCIM "%USERPROFILE%/Desktop/%%i"
for /F "usebackq delims=" %%i in (model.txt) do adb pull sdcard/Pictures "%USERPROFILE%/Desktop/%%i"
for /F "usebackq delims=" %%i in (model.txt) do adb pull sdcard/Download "%USERPROFILE%/Desktop/%%i"
for /F "usebackq delims=" %%i in (model.txt) do adb pull sdcard/Movies "%USERPROFILE%/Desktop/%%i"
for /F "usebackq delims=" %%i in (model.txt) do adb pull sdcard/Music "%USERPROFILE%/Desktop/%%i"
for /F "usebackq delims=" %%i in (model.txt) do adb pull sdcard/MIUI "%USERPROFILE%/Desktop/%%i"
for /F "usebackq delims=" %%i in (model.txt) do adb pull sdcard/Recorders "%USERPROFILE%/Desktop/%%i"
for /F "usebackq delims=" %%i in (model.txt) do adb pull sdcard/Recordings "%USERPROFILE%/Desktop/%%i"
for /F "usebackq delims=" %%i in (model.txt) do adb pull sdcard/Zapya "%USERPROFILE%/Desktop/%%i"
for /F "usebackq delims=" %%i in (model.txt) do adb pull "sdcard/Voice Recorder" "%USERPROFILE%/Desktop/%%i"
for /F "usebackq delims=" %%i in (model.txt) do start %USERPROFILE%/Desktop/%%i
cls
del model.txt
echo.
echo     Done
echo.
start www.ttamig3.com/contact.html

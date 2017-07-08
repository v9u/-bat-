@echo off

:start_agin
@cls
echo 请选择延时方法：
echo 1.使用ping方法延时
echo 2.使用vbs延时
echo 3.使用cscript执行vbs延时
echo 4.使用choice延时（推荐）
echo 5.退出

choice /c:12345 /m:"请选择延时方法（5秒后超时，默认选择第4种方法）" /d:4 /t:5

if %errorlevel%==255 echo "意外的错误！"
if %errorlevel%==5 goto exit_cmd
if %errorlevel%==4 goto method_choice
if %errorlevel%==3 goto method_vbs_cscript
if %errorlevel%==2 goto method_vbs_cript
if %errorlevel%==1 goto method_ping
if %errorlevel%==0 echo "错误！"

:exit_cmd
echo 按任意键退出
pause
exit

:method_choice
echo 开始执行延时，使用的方法：method_choice
@choice /c:q /t 5 /d q /m "需要保证用户不进行输入！" /n >nul
echo 延时执行完毕
pause
goto start_agin

:method_vbs_cscript
echo 开始执行延时，使用的方法：method_vbs_cscript
echo wscript.sleep 5000>sleep.vbs
@cscript sleep.vbs >nul
@del /f /s /q sleep.vbs>nul
echo 延时执行完毕
pause
goto start_agin

:method_vbs_cript
echo 开始执行延时，使用的方法：method_vbs_cript
echo wscript.sleep 5000>sleep.vbs
@start /wait sleep.vbs
@del /f /s /q sleep.vbs>nul
echo 延时执行完毕
pause
goto start_agin

:method_ping
echo 开始执行延时，使用的方法：method_ping
@ping 127.0.0.1 -n 6 >nul
echo 延时执行完毕
pause
goto start_agin
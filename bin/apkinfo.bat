@echo off
title AndroidInfo
@echo 执行sfa 录制脚本测试
::1包名，2输出路径
echo ----------------------开始测试------------------------------------
::adb shell top -n 1 -d 0.5 | grep %1>%2cpuinfo.txt
::adb shell top -n 1 -d 0.5 | grep eBest.mobile.android

::adb shell dumpsys meminfo %1 |grep "Dalvik">%2meminfo.txt
::adb shell dumpsys meminfo "eBest.mobile.android" |grep "TOTAL"


if not exist %2\cpuinfo\ mkdir %2\cpuinfo\
if not exist %2\meminfo\ mkdir %2\meminfo\

::ping方法用于等待或者休眠N秒
::for /l %%i in (1,1,200) do  ping 13.3.0.1 -n 1 -w 4000 >nul| @echo %%i|adb shell dumpsys meminfo %1 |grep "Dalvik">>%2\meminfo\meminfo.txt|adb shell top -n 1 -d 0.5 | grep %1>>%2\cpuinfo\cpuinfo.txt
for /l %%i in (1,1,200) do (
:start
ping 13.3.0.1 -n 1 -w 4000 >nul
set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
@echo %%i_%date:~0,4%%date:~5,2%%date:~8,2%_%currentHour%%time:~3,2%%time:~6,2%
adb shell dumpsys meminfo %1 |grep "TOTAL">>%2\meminfo\%date:~0,4%%date:~5,2%%date:~8,2%_%currentHour%%time:~3,2%%time:~6,2%meminfo.txt
adb shell top -n 1 -d 0.5 | grep %1>>%2\cpuinfo\%date:~0,4%%date:~5,2%%date:~8,2%_%currentHour%%time:~3,2%%time:~6,2%cpuinfo.txt
goto start
)
echo ----------------------结束测试------------------------------------

pause


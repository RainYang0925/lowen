title bat自动化编译
@echo 主入口文件
@echo off

::set basePath=g:\lwh\xwandou\code\monkeytest\
set basePath=%1
echo basePath:%basePath%



echo -
echo -
echo -
echo ----------------------开始测试sfa------------------------------------
set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
set currentTestName=%date:~0,4%%date:~5,2%%date:~8,2%_%currentHour%%time:~3,2%%time:~6,2%_SFA
set starttime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%currentHour%:%time:~3,2%:%time:~6,2%
::set basePath=g:\lwh\xwandou\code\monkeytest\
if not exist %basePath%out\%currentTestName% mkdir %basePath%out\%currentTestName%

::开启运行内存cpu日志记录
start %basePath%\bin\apkinfo.bat com.ebest.sfa %basePath%out\%currentTestName%

start %basePath%\bin\log.bat %basePath%out\%currentTestName%
:: 
::call monkeyrunner %basePath%tools\monkey_playbackNew.py %basePath%mr\sfadaka2.mr  %currentTestName%  %basePath%
::call monkeyrunner %basePath%tools\monkey_playbackNew.py %basePath%mr\kasfa_huawei_c199.mr  %currentTestName%  %basePath%
::call monkeyrunner %basePath%tools\monkey_playbackNew.py %basePath%mr\kasfa_huawei_c199_qingjia.mr  %currentTestName%  %basePath%
call monkeyrunner %basePath%tools\monkey_playbackNew.py mr=%basePath%mr\kasfa_SCH-I869_qingjia.mr  name=%currentTestName%  basePath=%basePath% scale=scale screen=480.800 

::关闭运行内存cpu日志记录
taskkill  /FI "WINDOWTITLE eq AndroidInfo"

set rrrstr=成功

findstr   "com.ebest.sfa" %basePath%out\%currentTestName%\androidlog.txt
set rrr=%errorlevel%
::if %rrr%==0 echo --------------------脚本(%currentTestName%)运行中Crash------------------- else echo 脚本(%currentTestName%)运行ok
if %rrr%==0 set rrrstr=失败|echo --------------------脚本(%currentTestName%)运行中Crash------------------- else echo 脚本(%currentTestName%)运行ok

set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
set endtime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%currentHour%:%time:~3,2%:%time:~6,2%
java -jar %basePath%\bin\HtmlOutPutCore.jar   out=%currentTestName% path=%basePath% -l apkPath=E:\lwh\apk\SFADali-2.1.0.1-1230-03-beta.apk aaptPath=%basePath%bin\aapt.exe result=%rrrstr% starttime=%starttime% endtime=%endtime%
echo ----------------------结束测试sfa------------------------------------




echo -
echo -
echo -

echo ----------------------开始测试妈妈购---------------------------------
::--------1.初始化路径，时间-------------
set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
set currentTestName=%date:~0,4%%date:~5,2%%date:~8,2%_%currentHour%%time:~3,2%%time:~6,2%_MMG
set starttime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%currentHour%:%time:~3,2%:%time:~6,2%
::currentTestName表示每一次执行测试脚本的out输出主目录

echo currentTestName:%currentTestName%
if not exist %basePath%out\%currentTestName% mkdir %basePath%out\%currentTestName%


::--------2.开启线程记录cpu，内存等日志-------------
::开启运行内存cpu日志记录
start %basePath%\bin\apkinfo.bat com.motherbuy.bmec.android %basePath%out\%currentTestName%

::--------3.开启线程记录adb log日志-------------
::将写入日志文件夹路径当作参数传给log.bat
start %basePath%\bin\log.bat %basePath%out\%currentTestName%


::--------4.执行py脚本-------------
::此处直接执行monkeyrunner命令，会导致后面的批处理无法运行，需要使用call命令
call monkeyrunner %basePath%tools\monkey_test.py  %currentTestName%  %basePath%

::--------5.关闭记录日志的线程（关闭窗口）-------------
::关闭运行内存cpu日志记录
taskkill  /FI "WINDOWTITLE eq AndroidInfo"

::--------6.读取adb log日志 判断是否crash-------------
set rrrstr=成功
findstr   "motherbuy" %basePath%out\%currentTestName%\androidlog.txt

set rrr=%errorlevel%
if %rrr%==0 set rrrstr=失败|echo --------------------脚本(%currentTestName%)运行中Crash------------------- else echo 脚本(%currentTestName%)运行ok



::--------7.输出html报表-------------
set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
set endtime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%currentHour%:%time:~3,2%:%time:~6,2%
java -jar %basePath%\bin\HtmlOutPutCore.jar   out=%currentTestName% path=%basePath% -l   apkPath=G:\lwh\zhenkun\B2C1.apk aaptPath=%basePath%bin\aapt.exe result=%rrrstr% starttime=%starttime% endtime=%endtime%

echo ----------------------结束测试妈妈购---------------------------------


echo -
echo -
echo -


:: 查找标题为AndroidMonkeyLog的进程
:: tasklist /FI "WINDOWTITLE eq AndroidMonkeyLog"
:: taskkill  /FI "WINDOWTITLE eq AndroidMonkeyLog"

pause



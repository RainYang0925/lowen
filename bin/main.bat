title bat�Զ�������

@echo ������ļ�
@echo off
echo ���ļ��Ѿ�������ʹ��bin\launch.py��������mrĿ¼�������еĽű�------------

::set basePath=g:\lwh\xwandou\code\monkeytest\
set basePath=%1
echo basePath:%basePath%



echo -
echo -
echo -
echo ----------------------��ʼ����sfa------------------------------------

::-------------------------------------------------------step-1-----------------------------------------------------------------------------
echo ----%time%----1.��ʼ��·����ʱ��-------------

::>>>> �˴�·����Ҫ�޸� >>>>
echo                 pkg           ��ʾ���Ե�apk����
set pkg=com.ebest.sfa
echo                 apkPath       ��ʾ���Ե�apk·��
set apkPath=E:/lwh/apk/SFADali-2.1.0.1-1230-03-beta.apk
echo                 act           ��ʾ���Ե�apk����activity
set act=com.ebest.sfa/com.ebest.sfa.login.activity.LoginActivity
echo                 mr            ��ʾ���Ե�apk¼�ƵĽű�·��
set mr=%basePath%mr\kasfa_SCH-I869_qingjia.mr
::<<<< �˴�·����Ҫ�޸� <<<<

set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
set currentTestName=%date:~0,4%%date:~5,2%%date:~8,2%_%currentHour%%time:~3,2%%time:~6,2%_SFA
set starttime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%currentHour%:%time:~3,2%:%time:~6,2%
::set basePath=g:\lwh\xwandou\code\monkeytest\
if not exist %basePath%out\%currentTestName% mkdir %basePath%out\%currentTestName%


::-------------------------------------------------------step-1-----------------------------------------------------------------------------



::-------------------------------------------------------step-2-----------------------------------------------------------------------------
echo ----%time%----2.�����̼߳�¼cpu���ڴ����־-------------
start %basePath%\bin\apkinfo.bat %pkg% %basePath%out\%currentTestName%
::-------------------------------------------------------step-2-----------------------------------------------------------------------------


::-------------------------------------------------------step-3-----------------------------------------------------------------------------
echo ----%time%----3.�����̼߳�¼adb log��־-------------
start %basePath%\bin\log.bat %basePath%out\%currentTestName%
::-------------------------------------------------------step-3-----------------------------------------------------------------------------


::-------------------------------------------------------step-4-----------------------------------------------------------------------------
echo ----%time%----4.ִ��py�ű�-------------
::call monkeyrunner %basePath%tools\monkey_playbackNew.py %basePath%mr\sfadaka2.mr  %currentTestName%  %basePath%
::call monkeyrunner %basePath%tools\monkey_playbackNew.py %basePath%mr\kasfa_huawei_c199.mr  %currentTestName%  %basePath%
::call monkeyrunner %basePath%tools\monkey_playbackNew.py %basePath%mr\kasfa_huawei_c199_qingjia.mr  %currentTestName%  %basePath%
call monkeyrunner %basePath%tools\monkey_playbackNew.py pkg=%pkg% apkPath=%apkPath% act=%act%  mr=%mr%  name=%currentTestName%  basePath=%basePath% scale=scale screen=480.800 
::-------------------------------------------------------step-4-----------------------------------------------------------------------------


::-------------------------------------------------------step-5-----------------------------------------------------------------------------
echo ----%time%-----5.����Ƭ���ˮӡ------------------
java -jar %basePath%bin\ImageMarkClickLogo.jar  -cl c=#000000 s=50 out=%basePath%out\%currentTestName%\
::-------------------------------------------------------step-5-----------------------------------------------------------------------------


::-------------------------------------------------------step-6-----------------------------------------------------------------------------
echo ----%time%----6.�رռ�¼��־���̣߳��رմ��ڣ�-------------
taskkill  /FI "WINDOWTITLE eq AndroidInfo"
taskkill  /FI "WINDOWTITLE eq AndroidMonkeyLog"
::-------------------------------------------------------step-6-----------------------------------------------------------------------------


::-------------------------------------------------------step-7-----------------------------------------------------------------------------
echo ----%time%----7.��ȡadb log��־ �ж��Ƿ�crash-------------
set rrrstr=�ɹ�
findstr   "com.ebest.sfa" %basePath%out\%currentTestName%\androidlog.txt
set rrr=%errorlevel%
::if %rrr%==0 echo --------------------�ű�(%currentTestName%)������Crash------------------- else echo �ű�(%currentTestName%)����ok
if %rrr%==0 set rrrstr=ʧ��|echo --------------------�ű�(%currentTestName%)������Crash------------------- else echo �ű�(%currentTestName%)����ok
::-------------------------------------------------------step-7-----------------------------------------------------------------------------


::-------------------------------------------------------step-8-----------------------------------------------------------------------------
echo ----%time%----8.���html����-------------
set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
set endtime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%currentHour%:%time:~3,2%:%time:~6,2%
java -jar %basePath%\bin\HtmlOutPutCore.jar   out=%currentTestName% path=%basePath%  apkPath=%apkPath% aaptPath=%basePath%bin\aapt.exe result=%rrrstr% starttime=%starttime% endtime=%endtime%
::-------------------------------------------------------step-8-----------------------------------------------------------------------------

echo ----------------------��������sfa------------------------------------




echo -
echo -
echo -

echo ----------------------��ʼ�������蹺---------------------------------
::-------------------------------------------------------step-1-----------------------------------------------------------------------------
echo ----%time%----1.��ʼ��·����ʱ��-------------

::>>>> �˴�·����Ҫ�޸� >>>>
::pkg ��ʾ���Ե�apk����
set pkg=com.motherbuy.bmec.android
::apkPath ��ʾ���Ե�apk·��
set apkPath=G:/lwh/zhenkun/B2C1.apk
::act ��ʾ���Ե�apk����activity
set act=com.motherbuy.bmec.android/com.motherbuy.bmec.android.WelcomeActivity
::mr ��ʾ���Ե�apk¼�ƵĽű�·��
::set mr=%basePath%mr\kasfa_SCH-I869_qingjia.mr
::<<<< �˴�·����Ҫ�޸� <<<<

set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
set currentTestName=%date:~0,4%%date:~5,2%%date:~8,2%_%currentHour%%time:~3,2%%time:~6,2%_MMG
set starttime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%currentHour%:%time:~3,2%:%time:~6,2%
::currentTestName��ʾÿһ��ִ�в��Խű���out�����Ŀ¼

echo currentTestName:%currentTestName%
if not exist %basePath%out\%currentTestName% mkdir %basePath%out\%currentTestName%
::-------------------------------------------------------step-1-----------------------------------------------------------------------------


::-------------------------------------------------------step-2-----------------------------------------------------------------------------
echo ----%time%----2.�����̼߳�¼cpu���ڴ����־-------------
::���������ڴ�cpu��־��¼
start %basePath%\bin\apkinfo.bat %pkg% %basePath%out\%currentTestName%
::-------------------------------------------------------step-2-----------------------------------------------------------------------------


::-------------------------------------------------------step-3-----------------------------------------------------------------------------
echo ----%time%----3.�����̼߳�¼adb log��־-------------
::��д����־�ļ���·��������������log.bat
start %basePath%\bin\log.bat %basePath%out\%currentTestName%
::-------------------------------------------------------step-3-----------------------------------------------------------------------------


::-------------------------------------------------------step-4-----------------------------------------------------------------------------
echo ----%time%----4.ִ��py�ű�-------------
::�˴�ֱ��ִ��monkeyrunner����ᵼ�º�����������޷����У���Ҫʹ��call����
call monkeyrunner %basePath%tools\monkey_test.py  name=%currentTestName%  basePath=%basePath% pkg=%pkg% apkPath=%apkPath% act=%act% 
::-------------------------------------------------------step-4-----------------------------------------------------------------------------


::-------------------------------------------------------step-5-----------------------------------------------------------------------------
echo ----%time%----5.����Ƭ���ˮӡ------------------
java -jar %basePath%bin\ImageMarkClickLogo.jar  -cl c=#000000 s=50 out=%basePath%out\%currentTestName%\
::-------------------------------------------------------step-5-----------------------------------------------------------------------------


::-------------------------------------------------------step-6-----------------------------------------------------------------------------
echo ----%time%----6.�رռ�¼��־���̣߳��رմ��ڣ�-------------
::�ر������ڴ�cpu��־��¼
taskkill  /FI "WINDOWTITLE eq AndroidInfo"
taskkill  /FI "WINDOWTITLE eq AndroidMonkeyLog"
::-------------------------------------------------------step-6-----------------------------------------------------------------------------


::-------------------------------------------------------step-7-----------------------------------------------------------------------------
echo ----%time%----7.��ȡadb log��־ �ж��Ƿ�crash-------------
set rrrstr=�ɹ�
findstr   %pkg% %basePath%out\%currentTestName%\androidlog.txt

set rrr=%errorlevel%
if %rrr%==0 set rrrstr=ʧ��|echo --------------------�ű�(%currentTestName%)������Crash------------------- else echo �ű�(%currentTestName%)����ok
::-------------------------------------------------------step-7-----------------------------------------------------------------------------



::-------------------------------------------------------step-8-----------------------------------------------------------------------------
echo ----%time%----8.���html����-------------
set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
set endtime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%currentHour%:%time:~3,2%:%time:~6,2%
java -jar %basePath%\bin\HtmlOutPutCore.jar   out=%currentTestName% path=%basePath% -l   apkPath=%apkPath% aaptPath=%basePath%bin\aapt.exe result=%rrrstr% starttime=%starttime% endtime=%endtime%
::-------------------------------------------------------step-8-----------------------------------------------------------------------------

echo ----------------------�����������蹺---------------------------------


echo -
echo -
echo -


:: ���ұ���ΪAndroidMonkeyLog�Ľ���
:: tasklist /FI "WINDOWTITLE eq AndroidMonkeyLog"
:: taskkill  /FI "WINDOWTITLE eq AndroidMonkeyLog"

pause



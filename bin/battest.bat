title bat�Զ�������
@echo ��ǰ·����%cd%
@echo ��ǰ������ȫ·����%~f0
@echo ��ǰ������Ŀ¼·����!cd!
echo ��ǰ�̷���%~d0
echo ��ǰ·����%cd%
echo ��ǰִ�������У�%0
echo ��ǰbat�ļ�·����%~dp0
echo ��ǰbat�ļ���·����%~sdp0

rem----------------------------���Ƿָ���------------------------------------------------------

rem cd g:/lwh/battest
set localP=%~sdp0
rem ����bat�ļ��������̷�
%localP:~0,2%
rem ����bat�ļ�������Ŀ¼
cd %localP%

rem----------------------------���Ƿָ���------------------------------------------------------

@echo ***************��ʼ��Ŀ¼***************

rem rm -rf xlstest
rem mkdir xlstest
rm -rf release

mkdir release


rem----------------------------���Ƿָ���------------------------------------------------------

@echo ***************��ȡ���õ�svnĿ¼***************

CALL readConfig svnpath svnpathValue 
ECHO %svnpathValue%


CALL readConfig propath propathValue 
ECHO %propathValue%

CALL readConfig versionName versionNameValue 
ECHO %versionNameValue%

CALL readConfig versionCode versionCodeValue 
ECHO %versionCodeValue%

rem----------------------------���Ƿָ���------------------------------------------------------

@echo ***************��ȡ�������***************
if EXIST .\%propathValue% (echo %propathValue%�ļ��Ѵ���) else ( svn co %svnpathValue% %propathValue%)
cd %propathValue%
svn update
rm -rf AndroidManifestNew.xml

rem----------------------------���Ƿָ���------------------------------------------------------

@echo ***************�޸ı���汾�ţ�������***************
rem sed  's/android:versionName="\(.*\)"/android:versionName="%versionNameValue%"/g' AndroidManifest.xml >>AndroidManifestNew.xml
rem -i��ʾ�޸�Դ�ļ�
rem sed  -i 's/android:versionName="\[\\d\\.\]*"/android:versionName="%versionNameValue%"/g' AndroidManifest.xml 
sed  -i 's/android:versionName="\(.*\)"/android:versionName="%versionNameValue%"/g;s/android:versionCode="\(.*\)"/android:versionCode="%versionCodeValue%"/g' AndroidManifest.xml



rem sed  -i 's/android:versionCode="[\\d\\.]*"/android:versionCode="%versionCodeValue%"/g' AndroidManifest.xml  
rem sed  -i 's/android:versionCode"\(.*\)"/android:versionCode="%versionCodeValue%"/g' AndroidManifest.xml  


rem----------------------------���Ƿָ���------------------------------------------------------

@echo ***************start��ʾ����CMD�������У���������ǰ���̣��൱���̣߳�***************
rem start ant release
@echo ***************��ʼ����汾***************
rem ant release

cd ..

@echo ***************�����ļ�����***************
rem ���ﵱ�������֮��鿴bin�ļ��������Ƿ���release.apk�ļ���֪���Ƿ����ɹ�
if EXIST .\%propathValue%\�����б�.xlsx copy /y .\%propathValue%\�����б�.xlsx .\release\%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%.apk


pause
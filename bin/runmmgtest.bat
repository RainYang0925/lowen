@echo ִ��monkey�������

echo ----------------------��ʼ�������蹺---------------------------------
set currentTestName=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%_MMG
set basePath=g:\lwh\xwandou\code\monkeytest\

::currentTestName��ʾÿһ��ִ�в��Խű���out�����Ŀ¼
echo currentTestName:%currentTestName%
mkdir g:\lwh\xwandou\code\monkeytest\out\%currentTestName%
::��д����־�ļ���·��������������log.bat
start log.bat g:\lwh\xwandou\code\monkeytest\out\%currentTestName%
::�˴�ֱ��ִ��monkeyrunner����ᵼ�º�����������޷����У���Ҫʹ��call����
call monkeyrunner g:\lwh\xwandou\code\monkeytest\tools\monkey_test.py %currentTestName% %basePath%

echo ----------------------�����������蹺---------------------------------
pause
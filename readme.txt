bin\main.bat
����ܴ���
	ѭ��ִ��N��py�ű�
		1.��ʼ��·����ʱ��
		2.�����̼߳�¼cpu���ڴ����־
		3.�����̼߳�¼adb log��־
		4.ִ��py�ű�
			4.1���нű�
			4.2���������ͼ����ˮӡ��ͨ��bin\ImageMarkClickLogo.jar��
		5.�رռ�¼��־���̣߳��رմ��ڣ�
		6.��ȡadb log��־ �ж��Ƿ�crash
		7.���html����

usage

�޸�bin\main.bat �����apk ·�� 
�޸�tools\monkey_playbackNew.py �����apk ·�� ,�Ͱ���
�޸�tools\monkey_test.py �����apk ·�� ,�Ͱ���


monkey_recorder.py
��Ҫ����¼�Ƶ�����¼��Ľű�

monkey_playback.py
��Ҫ����ִ��monkey_recorder.py¼�Ƶ�mr��β�Ľű�

mr
mr�ļ���������Ҫ��¼�ƵĲ����ű�
sfadaka1.mr��sfa��½������ͻ���ѯ�б�ű�-֧�ֻ�Ϊ��ҫ4A�ֻ�

ע����������������룬��Ҫ������py�ű���Ϊutf-8����

testn.py �����Զ������ģ�����app�Ľű����޸����������app����
	eg:
	#>monkeyrunner g:\lwh\xwandou\code\monkeytest\tools\testn.py


bin\ImageMarkClickLogo.jar
����ͼƬ���ˮӡ�Ĺ��߰�
�÷����testn.py
	'java -jar '+basePath+'bin/ImageMarkClickLogo.jar -l -cl c=#00ECdF s=50 out='+outpath

bin\HtmlOutPutCore.jar  
���ڽ����Խ������html����Ĺ��߰�
�÷���bin\main.bat
	java -jar %basePath%\bin\HtmlOutPutCore.jar   out=%currentTestName% path=%basePath% -l apkPath=E:\lwh\apk\SFADali-2.1.0.1-1230-03-beta.apk aaptPath=%basePath%bin\aapt.exe result=%rrrstr% starttime=%starttime% endtime=%endtime%

ע��������html�������룬��Ҫ������html_modelģ���Ϊutf-8���룬jar������Ƶ���utf-8����

eg:
G:\lwh\xwandou\code\monkeytest>monkeyrunner g:\lwh\xwandou\code\monkeytest\tools\monkey_playbackNew.py G:\lwh\xwandou\code\monkeytest\mr\sfadaka1.mr



apk ��Ϣ��ȡ�ο����ӣ�http://energykey.iteye.com/blog/1856173
demo ��ַ��
http://jixieshi999.github.io/lowen/out/
http://jixieshi999.github.io/lowen/out/20160112_162509_SFA/sh.htm
bin\main.bat
主框架代码
	循环执行N个py脚本
		1.初始化路径，时间
		2.开启线程记录cpu，内存等日志
		3.开启线程记录adb log日志
		4.执行py脚本
			4.1运行脚本
			4.2批量处理截图加上水印（通过bin\ImageMarkClickLogo.jar）
		5.关闭记录日志的线程（关闭窗口）
		6.读取adb log日志 判断是否crash
		7.输出html报表

usage

修改bin\main.bat 里面的apk 路径 
修改tools\monkey_playbackNew.py 里面的apk 路径 ,和包名
修改tools\monkey_test.py 里面的apk 路径 ,和包名


monkey_recorder.py
主要用于录制点击等事件的脚本

monkey_playback.py
主要用于执行monkey_recorder.py录制的mr结尾的脚本

mr
mr文件夹下面主要放录制的操作脚本
sfadaka1.mr是sfa登陆到进入客户查询列表脚本-支持华为荣耀4A手机

注：如果运行中文乱码，需要将所有py脚本改为utf-8编码

testn.py 用于自动化随机模拟测试app的脚本，修改里面的启动app包名
	eg:
	#>monkeyrunner g:\lwh\xwandou\code\monkeytest\tools\testn.py


bin\ImageMarkClickLogo.jar
用于图片添加水印的工具包
用法详见testn.py
	'java -jar '+basePath+'bin/ImageMarkClickLogo.jar -l -cl c=#00ECdF s=50 out='+outpath

bin\HtmlOutPutCore.jar  
用于将测试结果生成html报表的工具包
用法见bin\main.bat
	java -jar %basePath%\bin\HtmlOutPutCore.jar   out=%currentTestName% path=%basePath% -l apkPath=E:\lwh\apk\SFADali-2.1.0.1-1230-03-beta.apk aaptPath=%basePath%bin\aapt.exe result=%rrrstr% starttime=%starttime% endtime=%endtime%

注：如果输出html中文乱码，需要将所有html_model模板改为utf-8编码，jar里面控制的是utf-8编码

eg:
G:\lwh\xwandou\code\monkeytest>monkeyrunner g:\lwh\xwandou\code\monkeytest\tools\monkey_playbackNew.py G:\lwh\xwandou\code\monkeytest\mr\sfadaka1.mr



apk 信息提取参考链接：http://energykey.iteye.com/blog/1856173
demo 地址：
http://jixieshi999.github.io/lowen/out/
http://jixieshi999.github.io/lowen/out/20160112_162509_SFA/sh.htm

@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
setlocal EnableDelayedExpansion
set /a n=1
echo [36m################################## MINECRAFT FOR WINDOWS10 UNLOCK_LAUNCHER #########################
echo ##                                                                                                ##
echo ##     该程序将自动解锁、打开 Minecraft for Windows10 并在退出游戏后自动取消解锁（恢复原样）      ##
echo ##                                                                                                ##
echo ##                                                                         胡哲诚 制作            ##
echo ##                                                                                                ##
echo ####################################################################################################[33m
tasklist|find /i "Minecraft.Windows.exe"
if ERRORLEVEL 1 (
	goto started
) else (
	echo [31m#################### 错误！Minecraft for Windows10 正在运行,不能同时运行多个实例
	:alreadyStarted
	echo.
	echo [36m##############################################################################
	echo ##                                                                          ##
	echo ##   【1】关闭本程序                                                        ##
	echo ##   【2】强制关闭 Minecraft for Windows10 与本程序                         ##
	echo ##   【3】跳过检测状态并尝试结束 RuntimeBroker.exe 进程                     ##
	echo ##                                                                          ##
	echo ##############################################################################
	echo 你想要执行的操作[0m
	set msg=
	set /p msg=
	if !msg!==1 (
        echo [32m#################### 你选择了 关闭本程序
		exit
	) else if !msg!==2 (
        echo [32m#################### 你选择了 强制关闭 Minecraft for Windows10 与本程序
		taskkill /im Minecraft.Windows.exe /f
		exit
	) else if !msg!==3 (
        echo [32m#################### 你选择了 跳过检测状态并尝试结束 RuntimeBroker.exe 进程[33m
		timeout /t 3
		goto loop
	) else (
		echo [31m输入错误！
		goto alreadyStarted
	)
)
:scanInitialization
timeout /t 3
tasklist|find /i "Minecraft.Windows.exe"
if ERRORLEVEL 1 (
	echo [31m#################### 错误！Minecraft for Windows10 应当启动，但因未知原因未启动
	:notStarted
	echo.
	echo [36m##############################################################################
	echo ##                                                                          ##
	echo ##   【1】关闭本程序                                                        ##
	echo ##   【2】重新尝试启动 Minecraft for Windows10 并不再检测其状态             ##
	echo ##   【3】跳过检测状态并继续                                                ##
	echo ##                                                                          ##
	echo ##############################################################################
	echo 你想要执行的操作[0m
	set msg=
	set /p msg=
	if !msg!==1 (
        echo [32m#################### 你选择了 关闭本程序
		goto off
	) else if !msg!==2 (
        echo [32m#################### 你选择了 重新尝试启动 Minecraft for Windows10 并不再检测其状态[33m
		call Minecraft.lnk
		timeout /t 3
		goto loop
	) else if !msg!==3 (
        echo [32m#################### 你选择了 跳过检测状态并继续[33m
		timeout /t 3
		goto loop
	) else (
		echo [31m输入错误！
		goto notStarted
	)
) else (
	goto loop
)

:started
echo [33m####################正在解锁 Minecraft for Windows10
echo 正在添加注册表项
regedit /s Minecraft_ON.reg
if ERRORLEVEL 1 (
	echo 因未知原因添加注册表项失败
) else (
	echo 添加注册表项成功
)
timeout /t 1
net	stop ClipSVC
if ERRORLEVEL 1 (
	echo [31m#################### 错误！可能是因为已解锁 Minecraft for Windows10[33m
	timeout /t 2
	call Minecraft.lnk
	echo #################### 正在尝试启动 Minecraft for Windows10
	goto scanInitialization
) else (
	echo [32m#################### 成功！Minecraft for Windows10 已解锁[33m
	timeout /t 2
	call Minecraft.lnk
	echo #################### 正在尝试启动 Minecraft for Windows10
	goto scanInitialization
)
echo [32m#################### Minecraft for Windows10 已成功启动
:loop
if %n% LEQ 1 (
	echo [33m#################### 正在尝试结束第%n%次 RuntimeBroker.exe 进程【====----------------】%n%/6
) else if %n% == 2 (
	echo [33m#################### 正在尝试结束第%n%次 RuntimeBroker.exe 进程【========------------】%n%/6
) else if %n% == 3 (
	echo [33m#################### 正在尝试结束第%n%次 RuntimeBroker.exe 进程【============--------】%n%/6
) else if %n% == 4 (
	echo [33m#################### 正在尝试结束第%n%次 RuntimeBroker.exe 进程【================----】%n%/6
) else if %n% GTR 4 (
	echo [33m#################### 正在尝试结束第%n%次 RuntimeBroker.exe 进程【====================】%n%/6
)
taskkill /im RuntimeBroker.exe /f
if ERRORLEVEL 1 (
	if %n% GTR 5 (
	    echo [32m#################### 已成功结束第%n%次 RuntimeBroker.exe 进程  【====================】%n%/6
        echo [32m#################### 成功！共结束%n%次 RuntimeBroker.exe 进程[33m
		goto scan
    )
) else (
    set /a n=%n%+1
	if %n% LEQ 1 (
		echo [32m#################### 已成功结束第%n%次 RuntimeBroker.exe 进程  【====----------------】%n%/6
	) else if %n% == 2 (
		echo [32m#################### 已成功结束第%n%次 RuntimeBroker.exe 进程  【========------------】%n%/6
	) else if %n% == 3 (
		echo [32m#################### 已成功结束第%n%次 RuntimeBroker.exe 进程  【============--------】%n%/6
	) else if %n% == 4 (
		echo [32m#################### 已成功结束第%n%次 RuntimeBroker.exe 进程  【================----】%n%/6
	) else if %n% GTR 4 (
		echo [32m#################### 已成功结束第%n%次 RuntimeBroker.exe 进程  【====================】%n%/6
	)
)
goto loop

:scan
timeout /t 10
tasklist|find /i "Minecraft.Windows.exe"
if ERRORLEVEL 1 (
	echo [31m#################### Minecraft for Windows10 已退出
	goto off
) else (
	echo [32m#################### Minecraft for Windows10 运行中[33m
	goto scan
)
:off
echo [33m####################正在取消解锁 Minecraft for Windows10（恢复原样）
echo 正在添加注册表项
regedit /s Minecraft_OFF.reg
if ERRORLEVEL 1 (
	echo 因未知原因添加注册表项失败
) else (
	echo 添加注册表项成功
)
timeout /t 1
net	start ClipSVC
if ERRORLEVEL 1 (
	echo [31m#################### 错误！可能是因为 Minecraft for Windows10 还未解锁[33m
	timeout /t 3
	exit
) else (
	echo [32m#################### 成功！一切已恢复原样[33m
	timeout /t 3
	exit
)
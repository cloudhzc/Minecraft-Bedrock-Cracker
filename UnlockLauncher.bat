@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
setlocal EnableDelayedExpansion
set /a n=1
echo [36m################################## MINECRAFT FOR WINDOWS10 UNLOCK_LAUNCHER #########################
echo ##                                                                                                ##
echo ##     �ó����Զ��������� Minecraft for Windows10 �����˳���Ϸ���Զ�ȡ���������ָ�ԭ����      ##
echo ##                                                                                                ##
echo ##                                                                         ���ܳ� ����            ##
echo ##                                                                                                ##
echo ####################################################################################################[33m
tasklist|find /i "Minecraft.Windows.exe"
if ERRORLEVEL 1 (
	goto started
) else (
	echo [31m#################### ����Minecraft for Windows10 ��������,����ͬʱ���ж��ʵ��
	:alreadyStarted
	echo.
	echo [36m##############################################################################
	echo ##                                                                          ##
	echo ##   ��1���رձ�����                                                        ##
	echo ##   ��2��ǿ�ƹر� Minecraft for Windows10 �뱾����                         ##
	echo ##   ��3���������״̬�����Խ��� RuntimeBroker.exe ����                     ##
	echo ##                                                                          ##
	echo ##############################################################################
	echo ����Ҫִ�еĲ���[0m
	set msg=
	set /p msg=
	if !msg!==1 (
        echo [32m#################### ��ѡ���� �رձ�����
		exit
	) else if !msg!==2 (
        echo [32m#################### ��ѡ���� ǿ�ƹر� Minecraft for Windows10 �뱾����
		taskkill /im Minecraft.Windows.exe /f
		exit
	) else if !msg!==3 (
        echo [32m#################### ��ѡ���� �������״̬�����Խ��� RuntimeBroker.exe ����[33m
		timeout /t 3
		goto loop
	) else (
		echo [31m�������
		goto alreadyStarted
	)
)
:scanInitialization
timeout /t 3
tasklist|find /i "Minecraft.Windows.exe"
if ERRORLEVEL 1 (
	echo [31m#################### ����Minecraft for Windows10 Ӧ������������δ֪ԭ��δ����
	:notStarted
	echo.
	echo [36m##############################################################################
	echo ##                                                                          ##
	echo ##   ��1���رձ�����                                                        ##
	echo ##   ��2�����³������� Minecraft for Windows10 �����ټ����״̬             ##
	echo ##   ��3���������״̬������                                                ##
	echo ##                                                                          ##
	echo ##############################################################################
	echo ����Ҫִ�еĲ���[0m
	set msg=
	set /p msg=
	if !msg!==1 (
        echo [32m#################### ��ѡ���� �رձ�����
		goto off
	) else if !msg!==2 (
        echo [32m#################### ��ѡ���� ���³������� Minecraft for Windows10 �����ټ����״̬[33m
		call Minecraft.lnk
		timeout /t 3
		goto loop
	) else if !msg!==3 (
        echo [32m#################### ��ѡ���� �������״̬������[33m
		timeout /t 3
		goto loop
	) else (
		echo [31m�������
		goto notStarted
	)
) else (
	goto loop
)

:started
echo [33m####################���ڽ��� Minecraft for Windows10
echo �������ע�����
regedit /s Minecraft_ON.reg
if ERRORLEVEL 1 (
	echo ��δ֪ԭ�����ע�����ʧ��
) else (
	echo ���ע�����ɹ�
)
timeout /t 1
net	stop ClipSVC
if ERRORLEVEL 1 (
	echo [31m#################### ���󣡿�������Ϊ�ѽ��� Minecraft for Windows10[33m
	timeout /t 2
	call Minecraft.lnk
	echo #################### ���ڳ������� Minecraft for Windows10
	goto scanInitialization
) else (
	echo [32m#################### �ɹ���Minecraft for Windows10 �ѽ���[33m
	timeout /t 2
	call Minecraft.lnk
	echo #################### ���ڳ������� Minecraft for Windows10
	goto scanInitialization
)
echo [32m#################### Minecraft for Windows10 �ѳɹ�����
:loop
if %n% LEQ 1 (
	echo [33m#################### ���ڳ��Խ�����%n%�� RuntimeBroker.exe ���̡�====----------------��%n%/6
) else if %n% == 2 (
	echo [33m#################### ���ڳ��Խ�����%n%�� RuntimeBroker.exe ���̡�========------------��%n%/6
) else if %n% == 3 (
	echo [33m#################### ���ڳ��Խ�����%n%�� RuntimeBroker.exe ���̡�============--------��%n%/6
) else if %n% == 4 (
	echo [33m#################### ���ڳ��Խ�����%n%�� RuntimeBroker.exe ���̡�================----��%n%/6
) else if %n% GTR 4 (
	echo [33m#################### ���ڳ��Խ�����%n%�� RuntimeBroker.exe ���̡�====================��%n%/6
)
taskkill /im RuntimeBroker.exe /f
if ERRORLEVEL 1 (
	if %n% GTR 5 (
	    echo [32m#################### �ѳɹ�������%n%�� RuntimeBroker.exe ����  ��====================��%n%/6
        echo [32m#################### �ɹ���������%n%�� RuntimeBroker.exe ����[33m
		goto scan
    )
) else (
    set /a n=%n%+1
	if %n% LEQ 1 (
		echo [32m#################### �ѳɹ�������%n%�� RuntimeBroker.exe ����  ��====----------------��%n%/6
	) else if %n% == 2 (
		echo [32m#################### �ѳɹ�������%n%�� RuntimeBroker.exe ����  ��========------------��%n%/6
	) else if %n% == 3 (
		echo [32m#################### �ѳɹ�������%n%�� RuntimeBroker.exe ����  ��============--------��%n%/6
	) else if %n% == 4 (
		echo [32m#################### �ѳɹ�������%n%�� RuntimeBroker.exe ����  ��================----��%n%/6
	) else if %n% GTR 4 (
		echo [32m#################### �ѳɹ�������%n%�� RuntimeBroker.exe ����  ��====================��%n%/6
	)
)
goto loop

:scan
timeout /t 10
tasklist|find /i "Minecraft.Windows.exe"
if ERRORLEVEL 1 (
	echo [31m#################### Minecraft for Windows10 ���˳�
	goto off
) else (
	echo [32m#################### Minecraft for Windows10 ������[33m
	goto scan
)
:off
echo [33m####################����ȡ������ Minecraft for Windows10���ָ�ԭ����
echo �������ע�����
regedit /s Minecraft_OFF.reg
if ERRORLEVEL 1 (
	echo ��δ֪ԭ�����ע�����ʧ��
) else (
	echo ���ע�����ɹ�
)
timeout /t 1
net	start ClipSVC
if ERRORLEVEL 1 (
	echo [31m#################### ���󣡿�������Ϊ Minecraft for Windows10 ��δ����[33m
	timeout /t 3
	exit
) else (
	echo [32m#################### �ɹ���һ���ѻָ�ԭ��[33m
	timeout /t 3
	exit
)
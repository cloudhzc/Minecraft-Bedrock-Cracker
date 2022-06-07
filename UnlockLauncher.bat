@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
setlocal EnableDelayedExpansion
set /a n=1
echo [36m################################## MINECRAFT FOR WINDOWS10 UNLOCK_LAUNCHER #########################
echo ##                                                                                                ##
echo ##     ¸Ã³ÌĞò½«×Ô¶¯½âËø¡¢´ò¿ª Minecraft for Windows10 ²¢ÔÚÍË³öÓÎÏ·ºó×Ô¶¯È¡Ïû½âËø£¨»Ö¸´Ô­Ñù£©      ##
echo ##                                                                                                ##
echo ##                                                                         ºúÕÜ³Ï ÖÆ×÷            ##
echo ##                                                                                                ##
echo ####################################################################################################[33m
tasklist|find /i "Minecraft.Windows.exe"
if ERRORLEVEL 1 (
	goto started
) else (
	echo [31m#################### ´íÎó£¡Minecraft for Windows10 ÕıÔÚÔËĞĞ,²»ÄÜÍ¬Ê±ÔËĞĞ¶à¸öÊµÀı
	:alreadyStarted
	echo.
	echo [36m##############################################################################
	echo ##                                                                          ##
	echo ##   ¡¾1¡¿¹Ø±Õ±¾³ÌĞò                                                        ##
	echo ##   ¡¾2¡¿Ç¿ÖÆ¹Ø±Õ Minecraft for Windows10 Óë±¾³ÌĞò                         ##
	echo ##   ¡¾3¡¿Ìø¹ı¼ì²â×´Ì¬²¢³¢ÊÔ½áÊø RuntimeBroker.exe ½ø³Ì                     ##
	echo ##                                                                          ##
	echo ##############################################################################
	echo ÄãÏëÒªÖ´ĞĞµÄ²Ù×÷[0m
	set msg=
	set /p msg=
	if !msg!==1 (
        echo [32m#################### ÄãÑ¡ÔñÁË ¹Ø±Õ±¾³ÌĞò
		exit
	) else if !msg!==2 (
        echo [32m#################### ÄãÑ¡ÔñÁË Ç¿ÖÆ¹Ø±Õ Minecraft for Windows10 Óë±¾³ÌĞò
		taskkill /im Minecraft.Windows.exe /f
		exit
	) else if !msg!==3 (
        echo [32m#################### ÄãÑ¡ÔñÁË Ìø¹ı¼ì²â×´Ì¬²¢³¢ÊÔ½áÊø RuntimeBroker.exe ½ø³Ì[33m
		timeout /t 3
		goto loop
	) else (
		echo [31mÊäÈë´íÎó£¡
		goto alreadyStarted
	)
)
:scanInitialization
timeout /t 3
tasklist|find /i "Minecraft.Windows.exe"
if ERRORLEVEL 1 (
	echo [31m#################### ´íÎó£¡Minecraft for Windows10 Ó¦µ±Æô¶¯£¬µ«ÒòÎ´ÖªÔ­ÒòÎ´Æô¶¯
	:notStarted
	echo.
	echo [36m##############################################################################
	echo ##                                                                          ##
	echo ##   ¡¾1¡¿¹Ø±Õ±¾³ÌĞò                                                        ##
	echo ##   ¡¾2¡¿ÖØĞÂ³¢ÊÔÆô¶¯ Minecraft for Windows10 ²¢²»ÔÙ¼ì²âÆä×´Ì¬             ##
	echo ##   ¡¾3¡¿Ìø¹ı¼ì²â×´Ì¬²¢¼ÌĞø                                                ##
	echo ##                                                                          ##
	echo ##############################################################################
	echo ÄãÏëÒªÖ´ĞĞµÄ²Ù×÷[0m
	set msg=
	set /p msg=
	if !msg!==1 (
        echo [32m#################### ÄãÑ¡ÔñÁË ¹Ø±Õ±¾³ÌĞò
		goto off
	) else if !msg!==2 (
        echo [32m#################### ÄãÑ¡ÔñÁË ÖØĞÂ³¢ÊÔÆô¶¯ Minecraft for Windows10 ²¢²»ÔÙ¼ì²âÆä×´Ì¬[33m
		call Minecraft.lnk
		timeout /t 3
		goto loop
	) else if !msg!==3 (
        echo [32m#################### ÄãÑ¡ÔñÁË Ìø¹ı¼ì²â×´Ì¬²¢¼ÌĞø[33m
		timeout /t 3
		goto loop
	) else (
		echo [31mÊäÈë´íÎó£¡
		goto notStarted
	)
) else (
	goto loop
)

:started
echo [33m####################ÕıÔÚ½âËø Minecraft for Windows10
echo ÕıÔÚÌí¼Ó×¢²á±íÏî
regedit /s Minecraft_ON.reg
if ERRORLEVEL 1 (
	echo ÒòÎ´ÖªÔ­ÒòÌí¼Ó×¢²á±íÏîÊ§°Ü
) else (
	echo Ìí¼Ó×¢²á±íÏî³É¹¦
)
timeout /t 1
net	stop ClipSVC
if ERRORLEVEL 1 (
	echo [31m#################### ´íÎó£¡¿ÉÄÜÊÇÒòÎªÒÑ½âËø Minecraft for Windows10[33m
	timeout /t 2
	call Minecraft.lnk
	echo #################### ÕıÔÚ³¢ÊÔÆô¶¯ Minecraft for Windows10
	goto scanInitialization
) else (
	echo [32m#################### ³É¹¦£¡Minecraft for Windows10 ÒÑ½âËø[33m
	timeout /t 2
	call Minecraft.lnk
	echo #################### ÕıÔÚ³¢ÊÔÆô¶¯ Minecraft for Windows10
	goto scanInitialization
)
echo [32m#################### Minecraft for Windows10 ÒÑ³É¹¦Æô¶¯
:loop
if %n% LEQ 1 (
	echo [33m#################### ÕıÔÚ³¢ÊÔ½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì¡¾====----------------¡¿%n%/6
) else if %n% == 2 (
	echo [33m#################### ÕıÔÚ³¢ÊÔ½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì¡¾========------------¡¿%n%/6
) else if %n% == 3 (
	echo [33m#################### ÕıÔÚ³¢ÊÔ½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì¡¾============--------¡¿%n%/6
) else if %n% == 4 (
	echo [33m#################### ÕıÔÚ³¢ÊÔ½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì¡¾================----¡¿%n%/6
) else if %n% GTR 4 (
	echo [33m#################### ÕıÔÚ³¢ÊÔ½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì¡¾====================¡¿%n%/6
)
taskkill /im RuntimeBroker.exe /f
if ERRORLEVEL 1 (
	if %n% GTR 5 (
	    echo [32m#################### ÒÑ³É¹¦½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì  ¡¾====================¡¿%n%/6
        echo [32m#################### ³É¹¦£¡¹²½áÊø%n%´Î RuntimeBroker.exe ½ø³Ì[33m
		goto scan
    )
) else (
    set /a n=%n%+1
	if %n% LEQ 1 (
		echo [32m#################### ÒÑ³É¹¦½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì  ¡¾====----------------¡¿%n%/6
	) else if %n% == 2 (
		echo [32m#################### ÒÑ³É¹¦½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì  ¡¾========------------¡¿%n%/6
	) else if %n% == 3 (
		echo [32m#################### ÒÑ³É¹¦½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì  ¡¾============--------¡¿%n%/6
	) else if %n% == 4 (
		echo [32m#################### ÒÑ³É¹¦½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì  ¡¾================----¡¿%n%/6
	) else if %n% GTR 4 (
		echo [32m#################### ÒÑ³É¹¦½áÊøµÚ%n%´Î RuntimeBroker.exe ½ø³Ì  ¡¾====================¡¿%n%/6
	)
)
goto loop

:scan
timeout /t 10
tasklist|find /i "Minecraft.Windows.exe"
if ERRORLEVEL 1 (
	echo [31m#################### Minecraft for Windows10 ÒÑÍË³ö
	goto off
) else (
	echo [32m#################### Minecraft for Windows10 ÔËĞĞÖĞ[33m
	goto scan
)
:off
echo [33m####################ÕıÔÚÈ¡Ïû½âËø Minecraft for Windows10£¨»Ö¸´Ô­Ñù£©
echo ÕıÔÚÌí¼Ó×¢²á±íÏî
regedit /s Minecraft_OFF.reg
if ERRORLEVEL 1 (
	echo ÒòÎ´ÖªÔ­ÒòÌí¼Ó×¢²á±íÏîÊ§°Ü
) else (
	echo Ìí¼Ó×¢²á±íÏî³É¹¦
)
timeout /t 1
net	start ClipSVC
if ERRORLEVEL 1 (
	echo [31m#################### ´íÎó£¡¿ÉÄÜÊÇÒòÎª Minecraft for Windows10 »¹Î´½âËø[33m
	timeout /t 3
	exit
) else (
	echo [32m#################### ³É¹¦£¡Ò»ÇĞÒÑ»Ö¸´Ô­Ñù[33m
	timeout /t 3
	exit
)
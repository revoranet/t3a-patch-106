@echo off
:: setlocal enableDelayedExpansion
:: Simple batch bfme 1 patchswitcher between 1.04 and 1.06 testversion
:: define variables
:: muted files end *.bak
set bak=.bak

set big106=_patch106testbuildv2.big
set big105=_patch105.big
set big104=_patch104.big

set gd=game.dat
set gd04=.04
set gd05=.05
:: we use same game.dat as 105
set gd06=.05

:: switch from testpatch 106 to 104 or the other way round
if exist lotrbfme.exe if exist game.dat (
	if exist %big106% if exist %big105% if exist %big104% if exist %gd%%gd04% (
		echo Patch 1.06 Testversion is active, switching to Patch 1.04
		rename %big106% %big106%%bak%
		rename %big105% %big105%%bak%
		rename %gd% %gd%%gd06%
		rename %gd%%gd04% %gd%
		echo Done.
		goto end
	) else (
		echo Switching to 1.04 failed, nothing done.
		goto help
	)
	if exist %big104% if exist %big105%%bak% if exist %big106%%bak% if exist %gd%%gd06% (
		echo Patch 1.04 is active, switching to 1.06 Testversion
		rename %big105%%bak% %big105%
		rename %big106%%bak% %big106%
		rename %gd% %gd%%gd04%
		rename %gd%%gd06% %gd%
		echo Done.
		goto end
	) else (
		echo Switching to 1.06 failed, nothing done.
		goto help
	)
) else (
		echo This is not the main BFME directory or some files are screwed up, check manually!
		goto help
)
:help
echo ###################################################################
echo # To make this work:
echo # 0. The script needs to be in the same directory as the patches,
echo #    but you can create a shortcut.
echo #------------------------------------------------------------------
echo # After fresh install of BFME version 1.00
echo # 1. Install patch 1.03
echo # 2. Rename 'game.dat' from patch 1.03 to 'game.dat.04'.
echo #    Keep it in the installation directory.
echo # 3. Install Patch 1.04, 1.05, 1.06 as usual.
echo #------------------------------------------------------------------
echo # If you are already on Patch 1.06, make sure that you have the
echo # following files in your installation directory:
echo # - '_patch103/4/5/6.big' files
echo # - 'game.dat.04' which is the original game.dat from
echo #   patch 1.03 that is also used by patch 1.04.
echo # - 'game.dat' which is the game.dat file from patch 1.05.
echo ###################################################################
goto end

:end
pause
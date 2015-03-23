@echo off
setlocal
cd C:\festival\festival\win32\config
set OK=N
@echo Dewiswch y llais rhagosodedig:
@echo Please choose the default voice:
@echo 1: cb_cy_llg_diphone (Gogleddol/North Welsh, gwryw/male, 16kHz)
@echo 2: cb_cy_cw_diphone (Gogleddol/North Welsh, benyw/female, 16kHz)
@echo 3: hl_diphone (Deheuol/South Welsh, gwryw/male, 10kHz)  
@echo Dewiswch 1, 2 neu 3 yna pwyswch Return:
@echo Please type 1, 2 or 3 then press Return:
:again
set changed=0
set /p voice=
if /i [%voice%]==[1] goto llg
if /i [%voice%]==[2] goto cw
if /i [%voice%]==[3] goto end
goto again
:llg
copy config_llg.ini config.ini
goto end
:cw
copy config_cw.ini config.ini 
goto end
:end
@echo off
cls
for %%n in (%0) do set folder=%%~dpn
set i=1

doskey ifconfig=ipconfig $* || set i+=1
doskey clear=cls || set i+=1
doskey mv=move || set i+=1
doskey rn=ren || set i+=1
doskey rename=ren || set i+=1
doskey reboot=shutdown -r -t 0$* || set i+=1
doskey edit=notepad $* || set i+=1
doskey sublime=notepad $* || set i+=1
doskey rn=rename $* || set i+=1
doskey cp=copy $* || set i+=1
doskey uprofile=cd %userprofile% || set i+=1
doskey appmaj=choco outdated $* || set i+=1
doskey subl="%ProgramFiles%\Sublime Text 3\subl.exe" $* || set i+=1
doskey vs="%Program Files%\Microsoft VS Code\Code.exe" $* || set i+=1
doskey firefox="C:\Program Files\Mozilla Firefox\firefox.exe" $* || set i+=1

doskey ls=call %folder%\chemin.bat $* || set i+=1
doskey speedtest=call %folder%\speedtest.bat $* || set i+=1
doskey sp=call %folder%\speedtest.bat $* || set i+=1
doskey ipconf=call %folder%\ipconf.bat $* || set i+=1
doskey pingdns=call %folder%\pingdns.bat $* || set i+=1
doskey lis=call %folder%\lecteur.bat $* || set i+=1
doskey upgrade=call %folder%\upgrade.bat $* || set i+=1
doskey power=call %folder%\power.bat $* || set i+=1
doskey poweroff=call %folder%\poweroff.bat $* || set i+=1
doskey veille=call %folder%\veille.bat $* || set i+=1

doskey url=py "D:\python\url+1_v2.py"
doskey url3=py "D:\python\url+1_v3.py"

set logsPy="D:\Python\logs\"

chcp 65001 1>nul || set i+=1

if %i%==1 (echo ^$ ^[%computername%^]: UTF-8 activer ^| alias: ok) else (echo - - - - - - & echo alias: erreur & echo - - - - - - )
call %folder%\privileges.bat
if not defined privileges set "privileges=inconu"
prompt $$$S[%username%@%computername%]:[$P]$_$$$S[Admin PRIVILEGES: %privileges%]:$S
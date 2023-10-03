@echo off

:: Requiere chocolatey d'installer et privileges.bat dans le même dossier
call privileges.bat
if defined privileges (if not %privileges%==yes goto end) else goto end
echo.
echo ================================================================
echo liste des groupes d'applications:
echo ---------------------------------
echo.
echo drivers, utilitaires, navigateur, reseau-social, jeux,
echo drive, image, audiovideo, 3D, virtualisation, hardwaremonitor,
echo developpement, programationweb, programationpy, autres, tous
echo ================================================================
echo.

echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications lier aux drivers?[O,N]" & if errorlevel 2 (set drivers=skip & goto choixUtilitaires)
echo.
choice /n /c ON /m "Souhaitez-vous installer geforce-experience?[O,N]" & if errorlevel 0 set geforce-experience=o & if errorlevel 2 set geforce-experience=n
choice /n /c ON /m "Souhaitez-vous installer icue?[O,N]" & if errorlevel 0 set icue=o & if errorlevel 2 set icue=n
choice /n /c ON /m "Souhaitez-vous installer ddu?[O,N]" & if errorlevel 0 set ddu=o & if errorlevel 2 set ddu=n

:choixUtilitaires
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications utilitaires?[O,N]" & if errorlevel 2 (set utilitaires=skip & goto choixNavigateurs)
echo.
choice /n /c ON /m "Souhaitez-vous installer 7zip?[O,N]" & if errorlevel 0 set 7zip=o & if errorlevel 2 set 7zip=n
choice /n /c ON /m "Souhaitez-vous installer everything?[O,N]" & if errorlevel 0 set everything=o & if errorlevel 2 set everything=n
choice /n /c ON /m "Souhaitez-vous installer powertoys?[O,N]" & if errorlevel 0 set powertoys=o & if errorlevel 2 set powertoys=n
choice /n /c ON /m "Souhaitez-vous installer teamviewer?[O,N]" & if errorlevel 0 set teamviewer=o & if errorlevel 2 set teamviewer=n
choice /n /c ON /m "Souhaitez-vous installer chocolateygui?[O,N]" & if errorlevel 0 set chocolateygui=o & if errorlevel 2 set chocolateygui=n
choice /n /c ON /m "Souhaitez-vous installer sharex?[O,N]" & if errorlevel 0 set sharex=o & if errorlevel 2 set sharex=n
choice /n /c ON /m "Souhaitez-vous installer windirstat?[O,N]" & if errorlevel 0 set windirstat=o & if errorlevel 2 set windirstat=n
choice /n /c ON /m "Souhaitez-vous installer ccleaner?[O,N]" & if errorlevel 0 set ccleaner=o & if errorlevel 2 set ccleaner=n
choice /n /c ON /m "Souhaitez-vous installer adwcleaner?[O,N]" & if errorlevel 0 set adwcleaner=o & if errorlevel 2 set adwcleaner=n
choice /n /c ON /m "Souhaitez-vous installer filezilla?[O,N]" & if errorlevel 0 set filezilla=o & if errorlevel 2 set filezilla=n
choice /n /c ON /m "Souhaitez-vous installer vlc?[O,N]" & if errorlevel 0 set vlc=o & if errorlevel 2 set vlc=n
choice /n /c ON /m "Souhaitez-vous installer speedtest?[O,N]" & if errorlevel 0 set speedtest=o & if errorlevel 2 set speedtest=n
choice /n /c ON /m "Souhaitez-vous installer adobereader?[O,N]" & if errorlevel 0 set adobereader=o & if errorlevel 2 set adobereader=n
choice /n /c ON /m "Souhaitez-vous installer f.lux?[O,N]" & if errorlevel 0 set f.lux=o & if errorlevel 2 set f.lux=n
choice /n /c ON /m "Souhaitez-vous installer nano?[O,N]" & if errorlevel 0 set nano=o & if errorlevel 2 set nano=n
choice /n /c ON /m "Souhaitez-vous installer lsd?[O,N]" & if errorlevel 0 set lsd=o & if errorlevel 2 set lsd=n
choice /n /c ON /m "Souhaitez-vous installer java 8?[O,N]" & if errorlevel 0 set jre8=o & if errorlevel 2 set jre8=n
choice /n /c ON /m "Souhaitez-vous installer kodi?[O,N]" & if errorlevel 0 set kodi=o & if errorlevel 2 set kodi=n

:choixNavigateurs
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des navigateurs?[O,N]" & if errorlevel 2 (set navigateur=skip & goto choixResauSocial)
echo.
choice /n /c ON /m "Souhaitez-vous installer firefox?[O,N]" & if errorlevel 0 set firefox=o & if errorlevel 2 set firefox=n
choice /n /c ON /m "Souhaitez-vous installer chromium?[O,N]" & if errorlevel 0 set chromium=o & if errorlevel 2 set chromium=n
choice /n /c ON /m "Souhaitez-vous installer googlechrome?[O,N]" & if errorlevel 0 set googlechrome=o & if errorlevel 2 set googlechrome=n
choice /n /c ON /m "Souhaitez-vous installer microsoft-edge?[O,N]" & if errorlevel 0 set microsoft-edge=o & if errorlevel 2 set microsoft-edge=n
choice /n /c ON /m "Souhaitez-vous installer brave?[O,N]" & if errorlevel 0 set brave=o & if errorlevel 2 set brave=n
choice /n /c ON /m "Souhaitez-vous installer opera?[O,N]" & if errorlevel 0 set opera=o & if errorlevel 2 set opera=n
choice /n /c ON /m "Souhaitez-vous installer opera-neon?[O,N]" & if errorlevel 0 set opera-neon=o & if errorlevel 2 set opera-neon=n
choice /n /c ON /m "Souhaitez-vous installer opera-developer?[O,N]" & if errorlevel 0 set opera-developer=o & if errorlevel 2 set opera-developer=n
choice /n /c ON /m "Souhaitez-vous installer opera-gx?[O,N]" & if errorlevel 0 set opera-gx=o & if errorlevel 2 set opera-gx=n
choice /n /c ON /m "Souhaitez-vous installer vivaldi?[O,N]" & if errorlevel 0 set vivaldi=o & if errorlevel 2 set vivaldi=n

:choixResauSocial
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications reseaux-sociaux?[O,N]" & if errorlevel 2 (set reseau-social=skip & goto choixJeux)
echo.
choice /n /c ON /m "Souhaitez-vous installer teamspeak?[O,N]" & if errorlevel 0 set teamspeak=o & if errorlevel 2 set teamspeak=n
choice /n /c ON /m "Souhaitez-vous installer mumble?[O,N]" & if errorlevel 0 set mumble=o & if errorlevel 2 set mumble=n
choice /n /c ON /m "Souhaitez-vous installer discord?[O,N]" & if errorlevel 0 set discord=o & if errorlevel 2 set discord=n
choice /n /c ON /m "Souhaitez-vous installer discord-canary?[O,N]" & if errorlevel 0 set discord-canary=o & if errorlevel 2 set discord-canary=n
choice /n /c ON /m "Souhaitez-vous installer telegram?[O,N]" & if errorlevel 0 set telegram=o & if errorlevel 2 set telegram=n

:choixJeux
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des lauchers de jeux?[O,N]" & if errorlevel 2 (set jeux=skip & goto choixDrive)
echo.
choice /n /c ON /m "Souhaitez-vous installer steam?[O,N]" & if errorlevel 0 set steam=o & if errorlevel 2 set steam=n
choice /n /c ON /m "Souhaitez-vous installer origin?[O,N]" & if errorlevel 0 set origin=o & if errorlevel 2 set origin=n
choice /n /c ON /m "Souhaitez-vous installer epicgames?[O,N]" & if errorlevel 0 set epicgames=o & if errorlevel 2 set epicgames=n
choice /n /c ON /m "Souhaitez-vous installer uplay?[O,N]" & if errorlevel 0 set uplay=o & if errorlevel 2 set uplay=n
choice /n /c ON /m "Souhaitez-vous installer ubisoft-connect?[O,N]" & if errorlevel 0 set ubisoft-connect=o & if errorlevel 2 set ubisoft-connect=n
choice /n /c ON /m "Souhaitez-vous installer battle.net?[O,N]" & if errorlevel 0 set battle.net=o & if errorlevel 2 set battle.net=n

:choixDrive
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications drives(stockage en ligne)?[O,N]" & if errorlevel 2 (set drive=skip & goto choixImage)
echo.
choice /n /c ON /m "Souhaitez-vous installer megasync?[O,N]" & if errorlevel 0 set megasync=o & if errorlevel 2 set megasync=n
choice /n /c ON /m "Souhaitez-vous installer googledrive?[O,N]" & if errorlevel 0 set googledrive=o & if errorlevel 2 set googledrive=n
choice /n /c ON /m "Souhaitez-vous installer amazondrive?[O,N]" & if errorlevel 0 set amazondrive=o & if errorlevel 2 set amazondrive=n
choice /n /c ON /m "Souhaitez-vous installer dropbox?[O,N]" & if errorlevel 0 set dropbox=o & if errorlevel 2 set dropbox=n

:choixImage
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications de traitement d'images?[O,N]" & if errorlevel 2 (set image=skip & goto choixAudioVideo)
echo.
choice /n /c ON /m "Souhaitez-vous installer fsviewer?[O,N]" & if errorlevel 0 set fsviewer=o & if errorlevel 2 set fsviewer=n
choice /n /c ON /m "Souhaitez-vous installer rawtherapee?[O,N]" & if errorlevel 0 set rawtherapee=o & if errorlevel 2 set rawtherapee=n
choice /n /c ON /m "Souhaitez-vous installer darktable?[O,N]" & if errorlevel 0 set darktable=o & if errorlevel 2 set darktable=n
choice /n /c ON /m "Souhaitez-vous installer gimp?[O,N]" & if errorlevel 0 set gimp=o & if errorlevel 2 set gimp=n
choice /n /c ON /m "Souhaitez-vous installer krita?[O,N]" & if errorlevel 0 set krita=o & if errorlevel 2 set krita=n
choice /n /c ON /m "Souhaitez-vous installer clipstudio-paint?[O,N]" & if errorlevel 0 set clipstudio-paint=o & if errorlevel 2 set clipstudio-paint=n

:choixAudioVideo
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications traitement audio et video?[O,N]" & if errorlevel 2 (set audiovideo=skip & goto choixVM)
echo.
choice /n /c ON /m "Souhaitez-vous installer vlc?[O,N]" & if errorlevel 0 set vlc=o & if errorlevel 2 set vlc=n
choice /n /c ON /m "Souhaitez-vous installer audacity?[O,N]" & if errorlevel 0 set audacity=o & if errorlevel 2 set audacity=n
choice /n /c ON /m "Souhaitez-vous installer audacity-ffmpeg?[O,N]" & if errorlevel 0 set audacity-ffmpeg=o & if errorlevel 2 set audacity-ffmpeg=n
choice /n /c ON /m "Souhaitez-vous installer handbrake?[O,N]" & if errorlevel 0 set handbrake=o & if errorlevel 2 set handbrake=n
choice /n /c ON /m "Souhaitez-vous installer obs-studio?[O,N]" & if errorlevel 0 set obs-studio=o & if errorlevel 2 set obs-studio=n
choice /n /c ON /m "Souhaitez-vous installer streamlabs-obs?[O,N]" & if errorlevel 0 set streamlabs-obs=o & if errorlevel 2 set streamlabs-obs=n

:choixVM
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications de virtualisation?[O,N]" & if errorlevel 2 (set virtualisation=skip & goto choix3D)
echo.
choice /n /c ON /m "Souhaitez-vous installer vmware-workstation-player?[O,N]" & if errorlevel 0 set vmware-workstation-player=o & if errorlevel 2 set vmware-workstation-player=n
choice /n /c ON /m "Souhaitez-vous installer virtualbox?[O,N]" & if errorlevel 0 set virtualbox=o & if errorlevel 2 set virtualbox=n

:choix3D
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications 3D?[O,N]" & if errorlevel 2 (set 3D=skip & goto choixHardwareMonitor)
echo.
choice /n /c ON /m "Souhaitez-vous installer blender?[O,N]" & if errorlevel 0 set blender=o & if errorlevel 2 set blender=n

:choixHardwareMonitor
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications d'analyse hardware?[O,N]" & if errorlevel 2 (set hardwaremonitor=skip & goto choixdeveloppement)
echo.
choice /n /c ON /m "Souhaitez-vous installer cpu-z?[O,N]" & if errorlevel 0 set cpu-z=o & if errorlevel 2 set cpu-z=n
choice /n /c ON /m "Souhaitez-vous installer gpu-z?[O,N]" & if errorlevel 0 set gpu-z=o & if errorlevel 2 set gpu-z=n
choice /n /c ON /m "Souhaitez-vous installer aida64-extreme?[O,N]" & if errorlevel 0 set aida64-extreme=o & if errorlevel 2 set aida64-extreme=n
choice /n /c ON /m "Souhaitez-vous installer hwmonitor?[O,N]" & if errorlevel 0 set hwmonitor=o & if errorlevel 2 set hwmonitor=n
choice /n /c ON /m "Souhaitez-vous installer speccy?[O,N]" & if errorlevel 0 set speccy=o & if errorlevel 2 set speccy=n
choice /n /c ON /m "Souhaitez-vous installer hwinfo?[O,N]" & if errorlevel 0 set hwinfo=o & if errorlevel 2 set hwinfo=n
choice /n /c ON /m "Souhaitez-vous installer msiafterburner?[O,N]" & if errorlevel 0 set msiafterburner=o & if errorlevel 2 set msiafterburner=n
choice /n /c ON /m "Souhaitez-vous installer crystaldiskinfo?[O,N]" & if errorlevel 0 set crystaldiskinfo=o & if errorlevel 2 set crystaldiskinfo=n
choice /n /c ON /m "Souhaitez-vous installer userdiag?[O,N]" & if errorlevel 0 set userdiag=o & if errorlevel 2 set userdiag=n

:choixdeveloppement
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications de developpement?[O,N]" & if errorlevel 2 (set developpement=skip & goto choixProgramationWeb)
echo.
choice /n /c ON /m "Souhaitez-vous installer notepadplusplus?[O,N]" & if errorlevel 0 set notepadplusplus=o & if errorlevel 2 set notepadplusplus=n
choice /n /c ON /m "Souhaitez-vous installer sublimetext3?[O,N]" & if errorlevel 0 set sublimetext3=o & if errorlevel 2 set sublimetext3=n
choice /n /c ON /m "Souhaitez-vous installer visual studio code?[O,N]" & if errorlevel 0 set vscode=o & if errorlevel 2 set vscode=n
choice /n /c ON /m "Souhaitez-vous installer git?[O,N]" & if errorlevel 0 set git=o & if errorlevel 2 set git=n
choice /n /c ON /m "Souhaitez-vous installer github-desktop?[O,N]" & if errorlevel 0 set github-desktop=o & if errorlevel 2 set github-desktop=n
choice /n /c ON /m "Souhaitez-vous installer docker-desktop?[O,N]" & if errorlevel 0 set docker-desktop=o & if errorlevel 2 set docker-desktop=n
choice /n /c ON /m "Souhaitez-vous installer slack?[O,N]" & if errorlevel 0 set slack=o & if errorlevel 2 set slack=n

:choixProgramationWeb
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications programation web?[O,N]" & if errorlevel 2 (set programationweb=skip & goto choixProgramationpy)
echo.
choice /n /c ON /m "Souhaitez-vous installer nodejs?[O,N]" & if errorlevel 0 set nodejs=o & if errorlevel 2 set nodejs=n
choice /n /c ON /m "Souhaitez-vous installer php?[O,N]" & if errorlevel 0 set php=o & if errorlevel 2 set php=n
choice /n /c ON /m "Souhaitez-vous installer ruby?[O,N]" & if errorlevel 0 set ruby=o & if errorlevel 2 set ruby=n
choice /n /c ON /m "Souhaitez-vous installer mysql.workbench?[O,N]" & if errorlevel 0 set mysql.workbench=o & if errorlevel 2 set mysql.workbench=n
choice /n /c ON /m "Souhaitez-vous installer sass?[O,N]" & if errorlevel 0 set sass=o & if errorlevel 2 set sass=n
choice /n /c ON /m "Souhaitez-vous installer typescript?[O,N]" & if errorlevel 0 set typescript=o & if errorlevel 2 set typescript=n
choice /n /c ON /m "Souhaitez-vous installer sourcetree?[O,N]" & if errorlevel 0 set sourcetree=o & if errorlevel 2 set sourcetree=n

:choixProgramationpy
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer des applications programation python?[O,N]" & if errorlevel 2 (set programationpy=skip & goto choixAutres)
echo.
choice /n /c ON /m "Souhaitez-vous installer python?[O,N]" & if errorlevel 0 set python=o & if errorlevel 2 set python=n

:choixAutres
echo ----------------------------------------------------------------------------
choice /n /c ON /m "Souhaitez-vous installer d'autres applications?[O,N]" & if errorlevel 2 (set autres=skip & goto installation)
echo.
choice /n /c ON /m "Souhaitez-vous installer notion?[O,N]" & if errorlevel 0 set notion=o & if errorlevel 2 set notion=n
choice /n /c ON /m "Souhaitez-vous installer googleearthpro?[O,N]" & if errorlevel 0 set googleearthpro=o & if errorlevel 2 set googleearthpro=n
choice /n /c ON /m "Souhaitez-vous installer microsoft-teams?[O,N]" & if errorlevel 0 set microsoft-teams=o & if errorlevel 2 set microsoft-teams=n

:installation

:drivers
if %drivers%==skip goto utilitaires
if %geforce-experience%==o choco install geforce-experience --y
if %icue%==o choco install icue --y
if %ddu%==o choco install ddu --y

:utilitaires
if %utilitaires%==skip goto navigateur
if %7zip%==o choco install 7zip --y
if %everything%==o choco install everything --y
if %powertoys%==o choco install powertoys --y
if %teamviewer%==o choco install teamviewer --y
if %chocolateygui%==o choco install chocolateygui --y
if %sharex%==o choco install sharex --y
if %windirstat%==o choco install windirstat --y
if %ccleaner%==o choco install ccleaner --y
if %adwcleaner%==o choco install adwcleaner --y
if %filezilla%==o choco install filezilla --y
if %vlc%==o choco install vlc --y
if %speedtest%==o choco install speedtest --y
if %adobereader%==o choco install adobereader --y
if %f.lux%==o choco install f.lux --y
if %nano%==o choco install nano --y
if %lsd%==o choco install lsd --y
if %jre8%==o choco install jre8 --y
if %kodi%==o choco install kodi --y

:navigateur
if %navigateur%==skip goto reseau-social
if %firefox%==o choco install firefox --y
if %chromium%==o choco install chromium --y
if %googlechrome%==o choco install googlechrome --y
if %microsoft-edge%==o choco install microsoft-edge --y
if %brave%==o choco install brave --y
if %opera%==o choco install opera --y
if %opera-neon%==o choco install opera-neon --y
if %opera-developer%==o choco install opera-developer --y
if %opera-gx%==o choco install opera-gx --y
if %vivaldi%==o choco install vivaldi --y

:reseau-social
if %reseau-social%==skip goto jeux
if %teamspeak%==o choco install teamspeak --y
if %mumble%==o choco install mumble --y
if %discord%==o choco install discord --y
if %discord-canary%==o choco install discord-canary --y
if %telegram%==o choco install telegram --y

:jeux
if %jeux%==skip goto drive
if %steam%==o choco install steam --y
if %origin%==o choco install origin --y
if %epicgames%==o choco install epicgameslauncher --y
if %uplay%==o choco install uplay --y
if %ubisoft-connect%==o choco install ubisoft-connect --y
if %battle.net%==o choco install battle.net --y

:drive
if %drive%==o goto image
if %megasync%==o choco install megasync --y
if %googledrive%==o choco install googledrive --y
if %amazondrive%==o choco install amazondrive --y
if %dropbox%==o choco install dropbox --y

:image
if %image%==skip goto audiovideo
if %fsviewer%==o choco install fsviewer --y
if %rawtherapee%==o choco install rawtherapee --y
if %darktable%==o choco install darktable --y
if %gimp%==o choco install gimp --y
if %krita%==o choco install krita --y
if %clipstudio%==o choco install clipstudio-paint --y

:audiovideo
if %audiovideo%==skip goto virtualisation
if %vlc%==o choco install vlc --y
if %audacity%==o choco install audacity --y
if %audacity-ffmpeg%==o choco install audacity-ffmpeg --y
if %handbrake%==o choco install handbrake --y
if %obs-studio%==o choco install obs-studio --y
if %streamlabs%==o choco install streamlabs-obs --y

:virtualisation
if %virtualisation%==skip goto 3D
if %vmware-workstation-player%==o choco install vmware-workstation-player --y
if %virtualbox%==o choco install virtualbox --y

:3D
if %3D%==skip goto hardwaremonitor
if %blender%==o choco install blender --y

:hardwaremonitor
if %hardwaremonitor%==skip goto developpement
if %cpu-z%==o choco install cpu-z --y
if %gpu-z%==o choco install gpu-z --y
if %aida64-extreme%==o choco install aida64-extreme --y
if %hwmonitor%==o choco install hwmonitor --y
if %speccy%==o choco install speccy --y
if %hwinfo%==o choco install hwinfo --y
if %msiafterburner%==o choco install msiafterburner --y
if %crystaldiskinfo%==o choco install crystaldiskinfo --y
if %userdiag%==o start https://userdiag.com

:developpement
if %developpement%==skip goto programationweb
if %notepadplusplus%==o choco install notepadplusplus --y
if %sublimetext3%==o choco install sublimetext3 --y
if %vscode%==o choco install vscode --y
if %git%==o choco install git --y
if %github-desktop%==o choco install github-desktop --y
if %docker-desktop%==o choco install docker-desktop --y
if %slack%==o choco install slack --y

:programationweb
if %programationweb%==skip goto programationpy
if %nodejs%==o choco install nodejs --y
if %php%==o choco install php --y
if %ruby%==o choco install ruby --y
if %mysql.workbench%==o choco install mysql.workbench --y
if %sass%==o choco install sass --y
if %typescript%==o choco install typescript --y
if %sourcetree%==o choco install sourcetree --y

:programationpy
if %programationpy%==skip goto autres
if %python%==o choco install python --y

:autres
if %autres%==skip goto end
if %notion%==o choco install notion --y
if %googleearthpro%==o choco install googleearthpro --y
if %microsoft-teams%==o choco install microsoft-teams --y

:end
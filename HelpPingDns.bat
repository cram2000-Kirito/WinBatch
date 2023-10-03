@echo off

:aide
echo.
echo Utilitaire: faire des tests de la connexion
echo.
echo Utilisation: pingdns arg1: [serveur] [-help^|-?]
echo 		arg2: [nombre de ping(defaut: 4)]
echo.
echo Liste des serveurs:
echo =^> cloud1: DNS cloudflare primaire
echo =^> cloud2: DNS cloudflare secondaire
echo =^> google1: DNS google primaire
echo =^> google2: DNS google secondaire
echo =^> autre: entrer une adresse (IP^|URL)
echo =^> duo1: DNS primaire de cloudflare et google
echo =^> duo2: DNS secondaire de cloudflare et google
echo =^> duocloud: DNS cloudflare primaire et secondaire
echo =^> duogoogle: DNS google primaire et secondaire
echo.

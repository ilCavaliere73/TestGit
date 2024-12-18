@echo off
setlocal

rem Nome del file ZIP finale
set zipName=archivio.zip

rem Percorso di 7-Zip (facoltativo se aggiunto a PATH)
set sevenZip="C:\Program Files\7-Zip\7z.exe"

rem Comprimi tutte le cartelle nella directory corrente in un unico ZIP
%sevenZip% a -tzip %zipName% "*"

echo Compressione completata in %zipName%.
pause

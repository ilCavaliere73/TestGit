@echo off
setlocal enabledelayedexpansion

rem Nome della cartella di cui vuoi ottenere la data di ultima modifica
set folderPath=C:\Lorenzo\Studio\Python\Progetti

rem Verifica se la cartella esiste
if not exist "%folderPath%" (
    echo La cartella "%folderPath%" non esiste. Verifica il percorso.
    pause
    exit /b
)

rem Variabili per tracciare il file più recente
set latestDate=
set latestTime=
set latestFile=

rem Scansiona tutti i file nella directory
for /f "tokens=1,2,* delims= " %%A in ('dir /t:w /od /s "%folderPath%" ^| findstr /r /c:"^[0-9]"') do (
    set currentDate=%%A
    set currentTime=%%B
    set currentFile=%%C

    rem Aggiorna la data e il file se necessario
    set latestDate=!currentDate!
    set latestTime=!currentTime!
    set latestFile=!currentFile!
)

rem Debug: Mostra il file più recente
echo DEBUG: Ultimo file modificato = !latestFile!
echo DEBUG: Data = !latestDate!
echo DEBUG: Ora = !latestTime!

rem Verifica che le variabili siano state impostate
if "!latestFile!"=="" (
    echo Errore: Nessun file trovato nella directory "%folderPath%".
    pause
    exit /b
)

rem Rimuove caratteri non validi nei nomi dei file
set latestDate=!latestDate:/=-!
set latestDate=!latestDate:\=-!
set latestTime=!latestTime::=-!

rem Crea il file di testo con il nome basato su data e ora
set fileName=!latestDate!_!latestTime!.txt
echo Informazioni di ultima modifica basata su file nella cartella "%folderPath%" > "%fileName%"

rem Mostra i risultati finali
echo L'ultimo file modificato nella cartella "%folderPath%" e' stato: !latestFile!.
echo Data: !latestDate!, Ora: !latestTime!.
echo File creato: !fileName!

pause

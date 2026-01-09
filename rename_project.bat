@echo off
REM Batch скрипт для перейменування проєкту
REM Використання: rename_project.bat MQL_Pump_Controller

setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Помилка: Вкажіть нову назву проєкту
    echo Використання: %~n0.bat "MQL_Pump_Controller"
    exit /b 1
)

set NEW_NAME=%~1
set OLD_NAME=mql_2004_I2C_encoder_V2
set OLD_FILE=%OLD_NAME%.ino
set NEW_FILE=%NEW_NAME%.ino

echo === Перейменування проєкту ===
echo Стара назва: %OLD_NAME%
echo Нова назва: %NEW_NAME%
echo.

REM Перевірка існування файлу
if not exist "%OLD_FILE%" (
    echo Помилка: Файл %OLD_FILE% не знайдено!
    exit /b 1
)

REM Перейменування .ino файлу
echo 1. Перейменування %OLD_FILE% -^> %NEW_FILE%...
ren "%OLD_FILE%" "%NEW_FILE%"
if errorlevel 1 (
    echo    Помилка перейменування!
    exit /b 1
) else (
    echo    Файл перейменовано
)

REM Оновлення README.md
if exist "README.md" (
    echo 2. Оновлення README.md...
    powershell -Command "(Get-Content README.md -Raw) -replace '%OLD_FILE%', '%NEW_FILE%' -replace '%OLD_NAME%', '%NEW_NAME%' | Set-Content README.md -NoNewline"
    echo    README.md оновлено
)

REM Оновлення QUICK_START.md
if exist "QUICK_START.md" (
    echo 3. Оновлення QUICK_START.md...
    powershell -Command "(Get-Content QUICK_START.md -Raw) -replace '%OLD_FILE%', '%NEW_FILE%' -replace '%OLD_NAME%', '%NEW_NAME%' | Set-Content QUICK_START.md -NoNewline"
    echo    QUICK_START.md оновлено
)

echo.
echo === Готово! ===
echo Проєкт перейменовано на: %NEW_NAME%
echo.
echo Наступні кроки:
echo 1. Перевірте, що всі файли оновлені правильно
echo 2. Перейменуйте папку проєкту на: %NEW_NAME%
echo 3. Відкрийте проєкт в Arduino IDE та перевірте компіляцію

pause

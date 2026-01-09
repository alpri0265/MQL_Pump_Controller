# PowerShell скрипт для перейменування проєкту
# Використання: .\rename_project.ps1 -NewName "MQL_Pump_Controller"

param(
    [Parameter(Mandatory=$true)]
    [string]$NewName
)

$OldName = "mql_2004_I2C_encoder_V2"
$OldFileName = "$OldName.ino"
$NewFileName = "$NewName.ino"

Write-Host "=== Перейменування проєкту ===" -ForegroundColor Cyan
Write-Host "Стара назва: $OldName" -ForegroundColor Yellow
Write-Host "Нова назва: $NewName" -ForegroundColor Green
Write-Host ""

# Перевірка, чи існує старий файл
if (-not (Test-Path $OldFileName)) {
    Write-Host "Помилка: Файл $OldFileName не знайдено!" -ForegroundColor Red
    exit 1
}

# Перейменування .ino файлу
Write-Host "1. Перейменування $OldFileName -> $NewFileName..." -ForegroundColor Cyan
try {
    Rename-Item -Path $OldFileName -NewName $NewFileName -Force
    Write-Host "   ✓ Файл перейменовано" -ForegroundColor Green
} catch {
    Write-Host "   ✗ Помилка перейменування: $_" -ForegroundColor Red
    exit 1
}

# Оновлення коментаря в .ino файлі
Write-Host "2. Оновлення коментаря в $NewFileName..." -ForegroundColor Cyan
try {
    $content = Get-Content $NewFileName -Raw
    $content = $content -replace "mql_2004_I2C_encoder_V2", $NewName
    Set-Content -Path $NewFileName -Value $content -NoNewline
    Write-Host "   ✓ Коментар оновлено" -ForegroundColor Green
} catch {
    Write-Host "   ✗ Помилка оновлення: $_" -ForegroundColor Red
}

# Оновлення README.md
if (Test-Path "README.md") {
    Write-Host "3. Оновлення README.md..." -ForegroundColor Cyan
    try {
        $content = Get-Content "README.md" -Raw
        $content = $content -replace $OldFileName, $NewFileName
        $content = $content -replace $OldName, $NewName
        Set-Content -Path "README.md" -Value $content -NoNewline
        Write-Host "   ✓ README.md оновлено" -ForegroundColor Green
    } catch {
        Write-Host "   ✗ Помилка оновлення README.md: $_" -ForegroundColor Red
    }
}

# Оновлення QUICK_START.md
if (Test-Path "QUICK_START.md") {
    Write-Host "4. Оновлення QUICK_START.md..." -ForegroundColor Cyan
    try {
        $content = Get-Content "QUICK_START.md" -Raw
        $content = $content -replace $OldFileName, $NewFileName
        $content = $content -replace $OldName, $NewName
        Set-Content -Path "QUICK_START.md" -Value $content -NoNewline
        Write-Host "   ✓ QUICK_START.md оновлено" -ForegroundColor Green
    } catch {
        Write-Host "   ✗ Помилка оновлення QUICK_START.md: $_" -ForegroundColor Red
    }
}

# Оновлення CHANGELOG (якщо є)
if (Test-Path "CHANGELOG_encoder_micro_support.md") {
    Write-Host "5. Оновлення CHANGELOG..." -ForegroundColor Cyan
    try {
        $content = Get-Content "CHANGELOG_encoder_micro_support.md" -Raw
        $content = $content -replace $OldFileName, $NewFileName
        Set-Content -Path "CHANGELOG_encoder_micro_support.md" -Value $content -NoNewline
        Write-Host "   ✓ CHANGELOG оновлено" -ForegroundColor Green
    } catch {
        Write-Host "   ✗ Помилка оновлення CHANGELOG: $_" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "=== Готово! ===" -ForegroundColor Green
Write-Host "Проєкт перейменовано на: $NewName" -ForegroundColor Green
Write-Host ""
Write-Host "Наступні кроки:" -ForegroundColor Cyan
Write-Host "1. Перевірте, що всі файли оновлені правильно" -ForegroundColor White
Write-Host "2. Перейменуйте папку проєкту на: $NewName" -ForegroundColor White
Write-Host "3. Відкрийте проєкт в Arduino IDE та перевірте компіляцію" -ForegroundColor White
Write-Host "4. Створіть новий git репозиторій (якщо потрібно)" -ForegroundColor White

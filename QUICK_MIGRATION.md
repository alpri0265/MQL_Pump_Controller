# Швидка інструкція: Перенесення в новий репозиторій

## Швидкий спосіб (3 кроки)

### 1. Створіть нову папку та скопіюйте файли
```bash
# Створіть нову папку
mkdir C:\Users\ZbooK\OneDrive\Документы\Arduino\NewProjectName
cd C:\Users\ZbooK\OneDrive\Документы\Arduino\NewProjectName

# Скопіюйте всі файли з поточного проєкту (крім .git)
```

### 2. Перейменуйте проєкт

**Варіант A: Автоматично (PowerShell)**
```powershell
.\rename_project.ps1 -NewName "MQL_Pump_Controller"
```

**Варіант B: Автоматично (Batch)**
```cmd
rename_project.bat "MQL_Pump_Controller"
```

**Варіант C: Вручну**
1. Перейменуйте `mql_2004_I2C_encoder_V2.ino` → `MQL_Pump_Controller.ino`
2. Перейменуйте папку на `MQL_Pump_Controller`
3. Оновіть посилання в README.md

### 3. Створіть новий Git репозиторій
```bash
git init
git add .
git commit -m "Initial commit: MQL Pump Controller"
git remote add origin https://github.com/username/new-repo.git
git push -u origin main
```

## Важливо!

- **Назва папки = назва .ino файлу** (вимога Arduino IDE)
- Збережіть резервну копію перед перейменуванням
- Перевірте компіляцію в Arduino IDE після перейменування

## Детальна інструкція

Див. `MIGRATION_GUIDE.md` для повної інструкції з усіма деталями.

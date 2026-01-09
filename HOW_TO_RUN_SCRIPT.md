# Як запустити скрипт перейменування

## Варіант 1: Через PowerShell (рекомендовано)

### Крок 1: Відкрийте PowerShell
1. Натисніть `Win + X`
2. Виберіть **"Windows PowerShell"** або **"Terminal"**
3. Або натисніть `Win + R`, введіть `powershell` та натисніть Enter

### Крок 2: Перейдіть до папки проєкту
```powershell
cd "C:\Users\ZbooK\OneDrive\Документы\Arduino\mql_2004_I2C_encoder_V2\mql_2004_I2C_encoder_V2"
```

### Крок 3: Перевірте політику виконання
```powershell
Get-ExecutionPolicy
```

Якщо показує `Restricted`, виконайте:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
Натисніть `Y` для підтвердження.

### Крок 4: Запустіть скрипт
```powershell
.\rename_project.ps1 -NewName "MQL_Pump_Controller"
```

## Варіант 2: Через командний рядок (CMD)

### Крок 1: Відкрийте CMD
1. Натисніть `Win + R`
2. Введіть `cmd` та натисніть Enter

### Крок 2: Перейдіть до папки
```cmd
cd "C:\Users\ZbooK\OneDrive\Документы\Arduino\mql_2004_I2C_encoder_V2\mql_2004_I2C_encoder_V2"
```

### Крок 3: Запустіть Batch скрипт (простіше)
```cmd
rename_project.bat "MQL_Pump_Controller"
```

Або запустіть PowerShell скрипт через CMD:
```cmd
powershell -ExecutionPolicy Bypass -File rename_project.ps1 -NewName "MQL_Pump_Controller"
```

## Варіант 3: Через Провідник (найпростіше)

### Для Batch скрипту:
1. Відкрийте папку проєкту в Провіднику
2. Подвійний клік на `rename_project.bat`
3. Введіть нову назву, коли запитає (або відредагуйте скрипт)

### Для PowerShell скрипту:
1. Відкрийте папку проєкту в Провіднику
2. Клацніть правою кнопкою на `rename_project.ps1`
3. Виберіть **"Виконати з PowerShell"**
4. Або відкрийте PowerShell в цій папці:
   - В Провіднику натисніть `Shift + Права кнопка миші`
   - Виберіть **"Відкрити вікно PowerShell тут"**
   - Виконайте: `.\rename_project.ps1 -NewName "MQL_Pump_Controller"`

## Варіант 4: Через контекстне меню

1. Відкрийте папку проєкту
2. Клацніть правою кнопкою на `rename_project.ps1`
3. Виберіть **"Виконати з PowerShell"**
4. Якщо з'явиться помилка про політику виконання, виконайте:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
   Потім запустіть скрипт знову.

## Розв'язання проблем

### Помилка: "execution of scripts is disabled"

**Рішення:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Помилка: "cannot be loaded because running scripts is disabled"

**Рішення 1:** Запустіть PowerShell від імені адміністратора:
```powershell
Set-ExecutionPolicy RemoteSigned
```

**Рішення 2:** Обхід політики (одноразово):
```powershell
powershell -ExecutionPolicy Bypass -File .\rename_project.ps1 -NewName "MQL_Pump_Controller"
```

### Помилка: "File not found"

**Перевірте:**
1. Чи ви в правильній папці? (використайте `pwd` або `cd`)
2. Чи існує файл `rename_project.ps1`? (використайте `ls` або `dir`)

### Помилка: "Access denied"

**Рішення:**
- Запустіть PowerShell/CMD від імені адміністратора
- Або перевірте права доступу до файлів

## Альтернатива: Вручну (без скриптів)

Якщо скрипти не працюють, виконайте вручну:

1. **Перейменуйте файл:**
   - `mql_2004_I2C_encoder_V2.ino` → `MQL_Pump_Controller.ino`

2. **Оновіть коментар у файлі:**
   - Відкрийте `.ino` файл
   - Замініть перший рядок: `/* mql_2004_I2C_encoder_V2*/` → `/* MQL_Pump_Controller */`

3. **Оновіть README.md:**
   - Знайдіть всі `mql_2004_I2C_encoder_V2.ino` → замініть на `MQL_Pump_Controller.ino`
   - Знайдіть всі `mql_2004_I2C_encoder_V2` → замініть на `MQL_Pump_Controller`

4. **Перейменуйте папку:**
   - Назва папки повинна збігатися з назвою `.ino` файлу

## Перевірка результату

Після виконання скрипту:

1. Перевірте, що файл перейменовано:
   ```powershell
   ls *.ino
   ```

2. Перевірте, що коментар оновлено:
   ```powershell
   Get-Content MQL_Pump_Controller.ino -First 3
   ```

3. Відкрийте проєкт в Arduino IDE та перевірте компіляцію

---

**Найпростіший спосіб:** Використайте `rename_project.bat` - просто подвійний клік!

# Інструкція: Перенесення скетчу в новий репозиторій та перейменування

## Крок 1: Підготовка нового репозиторію

### Варіант A: Створити новий репозиторій на GitHub/GitLab

1. Створіть новий репозиторій на GitHub/GitLab
2. Скопіюйте URL репозиторію (наприклад: `https://github.com/username/new-repo-name.git`)

### Варіант B: Створити локальний репозиторій

```bash
# Створіть нову папку для нового репозиторію
mkdir C:\Users\ZbooK\OneDrive\Документы\Arduino\new-project-name
cd C:\Users\ZbooK\OneDrive\Документы\Arduino\new-project-name

# Ініціалізуйте git
git init
```

## Крок 2: Копіювання файлів

### Варіант A: Через Git (рекомендовано)

```bash
# З поточної папки проєкту
cd C:\Users\ZbooK\OneDrive\Документы\Arduino\mql_2004_I2C_encoder_V2\mql_2004_I2C_encoder_V2

# Створіть нову гілку для експорту
git checkout -b export-to-new-repo

# Скопіюйте всі файли (крім .git) в нову папку
# Або використайте git archive
git archive HEAD --format=zip --output=../project-export.zip
```

### Варіант B: Через файловий менеджер

1. Відкрийте поточну папку проєкту
2. Скопіюйте всі файли (крім `.git` папки)
3. Вставте в нову папку репозиторію

## Крок 3: Перейменування основного файлу

### 3.1. Виберіть нову назву

**Важливо:** Назва файлу `.ino` повинна збігатися з назвою папки проєкту в Arduino IDE!

Приклади:
- `MQL_Pump_Controller.ino`
- `Coolant_Control_System.ino`
- `MQL_2004_System.ino`

### 3.2. Перейменуйте файл

**Варіант A: Через файловий менеджер**
1. Знайдіть файл `mql_2004_I2C_encoder_V2.ino`
2. Перейменуйте на нову назву (наприклад: `MQL_Pump_Controller.ino`)

**Варіант B: Через командний рядок**
```bash
cd C:\Users\ZbooK\OneDrive\Документы\Arduino\new-project-name
ren mql_2004_I2C_encoder_V2.ino MQL_Pump_Controller.ino
```

### 3.3. Оновіть посилання в коді

Знайдіть та замініть посилання на стару назву:

#### У файлі `.ino` (перший рядок):
```cpp
/* mql_2004_I2C_encoder_V2*/
```
Замініть на:
```cpp
/* MQL_Pump_Controller */
```

#### У файлі `README.md`:
Знайдіть:
- `mql_2004_I2C_encoder_V2.ino` → замініть на нову назву
- Заголовок можна також оновити

#### У файлі `QUICK_START.md`:
Оновіть посилання, якщо є

#### У файлах документації:
- `GIT_COMMIT_MESSAGE.txt` - можна видалити або оновити
- `CHANGELOG_encoder_micro_support.md` - оновіть посилання

## Крок 4: Оновлення структури проєкту

### 4.1. Перейменуйте папку проєкту (якщо потрібно)

Якщо використовуєте Arduino IDE, назва папки повинна збігатися з назвою `.ino` файлу:

```
new-project-name/
  ├── MQL_Pump_Controller.ino  ← назва файлу
  ├── config.h
  ├── types.h
  ├── ... (інші файли)
```

### 4.2. Оновіть README.md

Змініть заголовок та опис проєкту:
```markdown
# MQL Pump Controller

## Опис
Система керування насосом MQL з LCD дисплеєм 2004...
```

## Крок 5: Налаштування Git

### 5.1. Створіть .gitignore (якщо немає)

```gitignore
# Arduino
*.hex
*.elf
*.bin
build/
*.cache

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Temporary files
*.tmp
*.bak
*~
```

### 5.2. Перший commit

```bash
cd C:\Users\ZbooK\OneDrive\Документы\Arduino\new-project-name

# Додайте всі файли
git add .

# Створіть перший commit
git commit -m "Initial commit: MQL Pump Controller

- Перенесено з mql_2004_I2C_encoder_V2
- Перейменовано основний файл
- Оновлено документацію"

# Якщо є віддалений репозиторій
git remote add origin https://github.com/username/new-repo-name.git
git branch -M main
git push -u origin main
```

## Крок 6: Перевірка

1. Відкрийте проєкт в Arduino IDE
2. Перевірте, що всі файли відкриваються
3. Перевірте компіляцію (Sketch → Verify/Compile)
4. Перевірте, що всі посилання в документації оновлені

## Крок 7: Очищення (опціонально)

Видаліть тимчасові файли:
- `GIT_COMMIT_MESSAGE.txt` (якщо не потрібен)
- `CHANGELOG_encoder_micro_support.md` (якщо не потрібен)
- `MIGRATION_GUIDE.md` (цей файл, після використання)

## Швидкий скрипт для автоматизації

Створіть файл `migrate.bat` в новій папці:

```batch
@echo off
echo Перейменування проєкту...

set NEW_NAME=MQL_Pump_Controller
set OLD_NAME=mql_2004_I2C_encoder_V2

echo Перейменування файлу .ino...
ren %OLD_NAME%.ino %NEW_NAME%.ino

echo Оновлення посилань в README.md...
powershell -Command "(Get-Content README.md) -replace '%OLD_NAME%', '%NEW_NAME%' | Set-Content README.md"

echo Готово!
pause
```

## Важливі примітки

1. **Назва папки = назва .ino файлу** - це вимога Arduino IDE
2. **Збережіть резервну копію** перед перейменуванням
3. **Перевірте всі посилання** в документації
4. **Оновіть .gitignore** якщо потрібно
5. **Створіть теги/релізи** для версій проєкту

## Приклад структури нового репозиторію

```
MQL_Pump_Controller/
├── MQL_Pump_Controller.ino    ← головний файл
├── config.h
├── types.h
├── settings.h
├── settings.cpp
├── input.h
├── input.cpp
├── encoder_k040.h
├── encoder_k040.cpp
├── menu.h
├── menu.cpp
├── ui.h
├── ui.cpp
├── ui_print.h
├── ui_print.cpp
├── ui_text_en.h
├── ui_text_ua.h
├── pump.h
├── pump.cpp
├── reco.h
├── reco.cpp
├── lcd_test.h
├── lcd_test.cpp
├── README.md
├── QUICK_START.md
├── .gitignore
└── LICENSE (опціонально)
```

---

**Після виконання всіх кроків ваш проєкт буде готовий до використання в новому репозиторії!**

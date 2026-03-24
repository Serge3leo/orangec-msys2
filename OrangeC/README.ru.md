<!-- vim:set sw=4 ts=8 fileencoding=utf8:
 SPDX-License-Identifier: BSD-2-Clause
 SPDX-FileCopyrightText: 2026 Сергей Леонтьев (leo@sai.msu.ru)
 -->

# Исправления CMake модулей поддержки Orange C
Исправляют поддержку:
- Динамических библиотек;
- `.rc` файлов ресурсов Windows;
- Выбора версий стандартов C/C++.

Для установки требуются права на создание и модификацию файлов в подкаталогах
`CMAKE_ROOT` текущего CMake.

# Использование
## Установка
```powershell
cmake -P OrangeC\install.cmake
```

Если не установлены.  Исправляет модули в `CMAKE_ROOT`.

## Удаление
```powershell
cmake -P OrangeC\uninstall.cmake
```

Отменяет исправления модулей из `CMAKE_ROOT` (с точностью до CRLF).

## Статус
```powershell
cmake -P OrangeC\detect.cmake
```

Проверяет наличие поддержки функций для текущего CMake.

## Известные особенности и ограничения

- В версиях 7.0 и выше поддерживается ключ `--export-all-symbols`, однако в
  правилах создания динамических библиотек не реализована поддержка целевого
  свойства `WINDOWS_EXPORT_ALL_SYMBOLS` и переменной
  `CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS`.  При необходимости, придётся вручную
  использовать ключ `--export-all-symbols`, или использовать `add_link_options(
  "$<IF:$<BOOL:$<TARGET_PROPERTY:WINDOWS_EXPORT_ALL_SYMBOLS>>,--export-all-symbols,>")`;

- В Orange C нет поддержки `.def` файлов экспорта (следует использовать, либо
  модуль `GenerateExportHeader`, либо использовать `__declspec(dllexport)` и
  `__declspec(dllimport)` вручную);

- Поддержка `.rc` файлов ресурсов для CMake реализована только для версии 7.0
  или выше.

#  Ссылки
Ссылки на запросы изменений CMake будут даны позднее.

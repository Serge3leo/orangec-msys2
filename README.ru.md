[![CMake on multiple platforms](https://github.com/Serge3leo/orangec-setup/actions/workflows/cmake-multi-platform.yml/badge.svg?branch=main)](https://github.com/Serge3leo/orangec-setup/actions/workflows/cmake-multi-platform.yml)

# orangec-setup
Устанавливает компилятор OrangeC и настраивает пути и переменные для
возможности использования CMake.

Смотрите так же [Исправления CMake модулей поддержки Orange C](
OrangeC/README.ru.md).

## ПРЕДУПРЕЖДЕНИЕ
Версия 6.0.42.1 (6.42.1) от Chocolatey Software несовместима с модулями
поддержки CMake.  Вы можете использовать версию 6.73.1 (частично совместима),
7.0.7 или выше.

# Использование
```
  - uses: Serge3leo/orangec-setup@v0
```

или

```
  - uses: Serge3leo/orangec-setup@v0
    with:
      version: 6.73.1
      verbose: true
```

Пример совместного использование в проекте CMake можно увидеть:
  - [Learn CMake on GitHub multiple platforms](
    https://github.com/Serge3leo/learn-cmake/blob/main/.github/workflows/learn_cmake.yml);
  - [cmake-multi-platform.yml](.github/workflows/cmake-multi-platform.yml);
  - [C23/C++14 platform independent implementation of C2y countof()](
    https://github.com/Serge3leo/countof_ns/blob/main/.github/workflows/cmake-multi-platform.yml).

# Параметры
## cache
  - Тип: `boolean`
  - Значение по умолчанию: `true`

Для ускорения повторного использования, кэшировать каталог установки OrangeC.

Возможно будет полезно использовать дополнительные рабочие процессы для
удаления тех кэшей, использование которых становится маловероятным (после
закрытия PR и т.п.). Шаблоны таких процессов: [Clean Cache Action](
https://github.com/marketplace/actions/clean-cache) или
https://github.com/marketplace/actions/clean-cache-action .

## cmake
  - Тип: `string`
  - Допустимые значения: исполняемая команда (путь) `cmake`
  - Значение по умолчанию: `cmake`

Задаёт команду `cmake`, используемую при установке модулей поддержки (т.е.
после установки именно эта команда `cmake` будет поддерживать компилятор Pelles
C).

## cmake-module
  - Тип: `string`
  - Допустимые значения: `check | always | no`
  - Значение по умолчанию: `check`

### always
Всегда исправлять модули поддержки Orange C.

### check
Проверить наличие.  Исправлять модули поддержки Orange C, если функции не
поддерживаются.

### no
Не исправлять модули поддержки Orange C.

## key-prefix
  - Тип: `string`

Добавляет префикс к ключу кэш (для обновления версии, идентификации и т.п.).

## verbose
  - Тип: `boolean`
  - Значение по умолчанию: `false`

Печатает пути и версии основных компонент: `occ`, `make`, `cmake`, ...

## version
  - Тип: `string`

Если не задан, устанавливается последняя доступная версия.  Список доступных
версии приведён:
[https://community.chocolatey.org/packages/orangec](https://community.chocolatey.org/packages/orangec).

# Ссылки
- [OrangeC: Can't create shared library (DLL) with Makefile generators](https://gitlab.kitware.com/cmake/cmake/-/work_items/27716)

# Участие
Замечания (issues), добавления или исправления (pr) - принимаются и
приветствуются.

# Лицензия
[BSD-2-Clause © 2026 Сергей Леонтьев (leo@sai.msu.ru).](LICENSE)

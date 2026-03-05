[![CMake on multiple platforms](https://github.com/Serge3leo/orangec-msys2/actions/workflows/cmake-multi-platform.yml/badge.svg?branch=main)](https://github.com/Serge3leo/orangec-msys2/actions/workflows/cmake-multi-platform.yml)

# orangec-msys2
Устанавливает компилятор OrangeC, MSYS2 и настраивает пути и переменные для
возможности использования CMake генератора "MSYS Makefiles".

## ПРЕДУПРЕЖДЕНИЕ
Версия 6.0.42.1 (6.42.1) от Chocolatey Software несовместима с модулями
поддержки CMake.  Вы можете использовать версию 6.73.1 или выше.

# Использование
```
  - uses: Serge3leo/orangec-msys2@v0
```

или

```
  - uses: Serge3leo/orangec-msys2@v0
    with:
      version: 6.73.1
      verbose: true
```

Пример совместного использование в проекте CMake можно увидеть:
  - [cmake-multi-platform.yml](.github/workflows/cmake-multi-platform.yml);
  - [C23/C++14 platform independent implementation of C2y countof()](
    https://github.com/Serge3leo/countof_ns/blob/main/.github/workflows/cmake-multi-platform.yml).

# Параметры
## cache
  - Тип: `boolean`
  - Значение по умолчанию: `true`

Для ускорения повторного использования, кэшировать `MSYS2` и каталог установки
OrangeC.

## cmake-update
  - Тип: `boolean`
  - Значение по умолчанию: `false`

Устанавливает в MSYS2 последнюю версию CMake.

## install
  - Тип: `string`
  - Допустимые значения: список пакетов, разделенных пробелами

Установка дополнительных пакетов после обновления системы поддерживается с
помощью опции install.  См. [Setup MSYS2, install](
https://github.com/msys2/setup-msys2?tab=readme-ov-file#install).

## key-prefix
  - Тип: `string`

Добавляет префикс к ключу кэш (для обновления версии, идентификации и т.п.).

## msystem
  - Тип: string
  - Допустимые значения: `msys | mingw64 | mingw32 | ucrt64 | clang64 |
    clangarm64 | skip`
  - Значение по умолчанию: `mingw64`

Задаёт значение переменной окружения [`MSYSTEM`](
https://www.msys2.org/docs/environments) и `PATH`.  Регистр игнорируется.  Если
равно `skip`, то настройка MSYS2 пропускается.

## pacboy
  - Тип: `string`
  - Допустимые значения: список пакетов, разделенных пробелами

Установка дополнительных пакетов после обновления системы поддерживается с
помощью опции pacboy.  См. [Setup MSYS2, pacboy](
https://github.com/msys2/setup-msys2?tab=readme-ov-file#pacboy).

## verbose
  - Тип: `boolean`
  - Значение по умолчанию: `false`

Печатает пути и версии основных компонент: `occ`, `make`, `cmake`, ...

## version
  - Тип: `string`

Если не задан, устанавливается последняя доступная версия.  Список доступных
версии приведён:
[https://community.chocolatey.org/packages/orangec](https://community.chocolatey.org/packages/orangec).

# Участие
Замечания (issues), добавления или исправления (pr) - принимаются и
приветствуются.

# Лицензия
[BSD-2-Clause © 2026 Сергей Леонтьев (leo@sai.msu.ru).](LICENSE)

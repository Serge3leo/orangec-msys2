[![CMake on multiple platforms](https://github.com/Serge3leo/orangec-msys2/actions/workflows/cmake-multi-platform.yml/badge.svg)](https://github.com/Serge3leo/orangec-msys2/actions/workflows/cmake-multi-platform.yml)

# orangec-msys2
Устанавливает компилятор OrangeC и настраивает пути и переменные для
возможности использования CMake генератора "MSYS Makefiles" совместно с
предустановленным в образе MSYS2.

# Использование
```
  - uses: Serge3leo/orangec-msys2@v0
```

Или

```
  - uses: Serge3leo/orangec-msys2@v0
    with:
      version: 6.73.1
      verbose: on
```

Пример совместного использование в проекте CMake можно увидеть:
  - [cmake-multi-platform.yml](.github/workflows/cmake-multi-platform.yml);
  - [C23/C++14 platform independent implementation of C2y countof()];
    (https://github.com/Serge3leo/countof_ns/blob/main/.github/workflows/cmake-multi-platform.yml).

# Параметры
## version
  - Тип: `string`

Если не задан, устанавливается последняя доступная версия. Список доступных
версии приведён:
[https://community.chocolatey.org/packages/orangec](https://community.chocolatey.org/packages/orangec).

## verbose
  - Тип: `string`
  - Возможные значения: `on | off`
  - Значение по умолчанию: `off`

Печатает пути и версии основных компонент: `occ`, `make`, `cmake`, ...

# Участие
Замечания (issues), добавления или исправления (pr) - принимаются и
приветствуются.

# Лицензия
[BSD-2-Clause © 2025 Сергей Леонтьев (leo@sai.msu.ru).](LICENSE)

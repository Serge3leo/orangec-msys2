[![CMake on multiple platforms](https://github.com/Serge3leo/orangec-msys2/actions/workflows/cmake-multi-platform.yml/badge.svg)](https://github.com/Serge3leo/orangec-msys2/actions/workflows/cmake-multi-platform.yml)

# orangec-msys2
Installs the OrangeC compiler and configures paths and environment variables
for the possibility of using the CMake generator "MSYS Makefiles" with the
pre-installed MSYS2 image.

# Usage
```
  - uses: Serge3leo/orangec-msys2@v0
```

or

```
  - uses: Serge3leo/orangec-msys2@v0
    with:
      version: 6.73.1
      verbose: on
```

An example with a CMake project can be see:
  - [cmake-multi-platform.yml](.github/workflows/cmake-multi-platform.yml);
  - [C23/C++14 platform independent implementation of C2y countof()](
    https://github.com/Serge3leo/countof_ns/blob/main/.github/workflows/cmake-multi-platform.yml).

# Options
## version
  - Type: `string`

If not specified, the latest available version is installed. The list of
available versions is given below:
[https://community.chocolatey.org/packages/orangec](https://community.chocolatey.org/packages/orangec).

## verbose
  - Type: `boolean`
  - Default: `false`

Show the paths and versions of the main components: `occ`, `make`, `cmake`, ...

# Contributing
Issues or PRs are accepted and welcome.

# Disclaimer
Sorry for my best English. Alas, this file is actually a yandex translation of
[README.ru.md](README.ru.md) with minimal editorial changes.

# License
[BSD-2-Clause © 2025 Сергей Леонтьев (leo@sai.msu.ru).](LICENSE)

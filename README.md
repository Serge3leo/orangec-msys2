[![CMake on multiple platforms](https://github.com/Serge3leo/orangec-msys2/actions/workflows/cmake-multi-platform.yml/badge.svg?branch=main)](https://github.com/Serge3leo/orangec-msys2/actions/workflows/cmake-multi-platform.yml)

# orangec-msys2
It installs the OrangeC compiler, MSYS2, and configures paths and variables for
the ability to use the CMake "MSYS Makefiles" generator.

## WARNING
Version 6.0.42.1 (6.42.1) of Chocolatey Software is incompatible with CMake
support modules. You can use version 6.73.1 or higher.

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
## cache
  - Type: `boolean`
  - Default: `true`

To speed up re-use, cache `MSYS2` and the installation directory OrangeC.

## cmake-update
  - Type: `boolean`
  - Default: `false`

Instal last CMake version from MSYS2.

## key-prefix
  - Type: `string`

Add prefix to cache key (for refresh version, identification etc).

## msystem
  - Type: `string`
  - Allowed values: `msys | mingw64 | mingw32 | ucrt64 |
    clang64 | clangarm64 | skip`
  - Default: `mingw64`

Sets the value of the environment variable [`MSYSTEM`](
https://www.msys2.org/docs/environments) and `PATH`.  Case is ignored.  If
equal to `skip`, then the MSYS2 configuration is skipped.

## verbose
  - Type: `boolean`
  - Default: `false`

Show the paths and versions of the main components: `occ`, `make`, `cmake`, ...

## version
  - Type: `string`

If not specified, the latest available version is installed. The list of
available versions is given below:
[https://community.chocolatey.org/packages/orangec](https://community.chocolatey.org/packages/orangec).

# Contributing
Issues or PRs are accepted and welcome.

# Disclaimer
Sorry for my best English. Alas, this file is actually a yandex translation of
[README.ru.md](README.ru.md) with minimal editorial changes.

# License
[BSD-2-Clause © 2026 Сергей Леонтьев (leo@sai.msu.ru).](LICENSE)

[![CMake on multiple platforms](https://github.com/Serge3leo/orangec-msys2/actions/workflows/cmake-multi-platform.yml/badge.svg?branch=main)](https://github.com/Serge3leo/orangec-msys2/actions/workflows/cmake-multi-platform.yml)

# orangec-msys2
It installs the OrangeC compiler, MSYS2, and configures paths and variables for
the ability to use the CMake "MSYS Makefiles" generator.

See also [Patches for Orange C support modules CMake]( OrangeC/README.md).

## WARNING
Version 6.0.42.1 (6.42.1) of Chocolatey Software is incompatible with CMake
support modules.  You can use version 6.73.1 (partially compatible),
7.0.7, or higher.

# Usage
```
  - uses: Serge3leo/orangec-msys2@v0
```

or

```
  - uses: Serge3leo/orangec-msys2@v0
    with:
      version: 6.73.1
      verbose: true
```

An example with a CMake project can be see:
  - [Learn CMake on GitHub multiple platforms](
    https://github.com/Serge3leo/learn-cmake/blob/main/.github/workflows/learn_cmake.yml);
  - [cmake-multi-platform.yml](.github/workflows/cmake-multi-platform.yml);
  - [C23/C++14 platform independent implementation of C2y countof()](
    https://github.com/Serge3leo/countof_ns/blob/main/.github/workflows/cmake-multi-platform.yml).

# Options
## cache
  - Type: `boolean`
  - Default: `true`

To speed up re-use, cache `MSYS2` and the installation directory OrangeC.

It may be useful to use additional workflows to delete caches that are unlikely
to be used (after a PR is closed, etc.).  Templates for such workflows: [Clean
Cache Action]( https://github.com/marketplace/actions/clean-cache) or
https://github.com/marketplace/actions/clean-cache-action .

## cmake-module
  - Type: `string`
  - Allowed values: `check | always | not`
  - Default: `check`

### always
Always patching Orange C support modules.

### check
Check availability. Patch Orange C support modules if features are not
supported.

### no
Do not patch the Orange C support modules.

## cmake-update
  - Type: `boolean`
  - Default: `false`

Instal last CMake version from MSYS2.

## install
  - Type: `string`
  - Allowed values: a whitespace separated list of packages

Installing additional packages after updating the system is supported through
option install.  See [Setup MSYS2, install](
https://github.com/msys2/setup-msys2?tab=readme-ov-file#install).

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

## pacboy
  - Type: `string`
  - Allowed values: a whitespace separated list of packages

Installing additional packages with pacboy after updating the system is
supported through option pacboy.  See [Setup MSYS2, pacboy](
https://github.com/msys2/setup-msys2?tab=readme-ov-file#pacboy).

## verbose
  - Type: `boolean`
  - Default: `false`

Show the paths and versions of the main components: `occ`, `make`, `cmake`, ...

## version
  - Type: `string`

If not specified, the latest available version is installed.  The list of
available versions is given below:
[https://community.chocolatey.org/packages/orangec](https://community.chocolatey.org/packages/orangec).

# Contributing
Issues or PRs are accepted and welcome.

# Disclaimer
Sorry for my best English.  Alas, this file is actually a yandex translation of
[README.ru.md](README.ru.md) with minimal editorial changes.

# License
[BSD-2-Clause © 2026 Сергей Леонтьев (leo@sai.msu.ru).](LICENSE)

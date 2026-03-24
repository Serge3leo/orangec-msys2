[![CMake on multiple platforms](https://github.com/Serge3leo/orangec-setup/actions/workflows/cmake-multi-platform.yml/badge.svg?branch=main)](https://github.com/Serge3leo/orangec-setup/actions/workflows/cmake-multi-platform.yml)

# orangec-setup
Installs the OrangeC compiler and configures paths and variables for the
ability to use the CMake.

See also [Patches for Orange C support modules CMake]( OrangeC/README.md).

## WARNING
Version 6.0.42.1 (6.42.1) of Chocolatey Software is incompatible with CMake
support modules.  You can use version 6.73.1 (partially compatible),
7.0.7, or higher.

# Usage
```
  - uses: Serge3leo/orangec-setup@v0
```

or

```
  - uses: Serge3leo/orangec-setup@v0
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

To speed up re-use, cache installation directory OrangeC.

It may be useful to use additional workflows to delete caches that are unlikely
to be used (after a PR is closed, etc.).  Templates for such workflows: [Clean
Cache Action]( https://github.com/marketplace/actions/clean-cache) or
https://github.com/marketplace/actions/clean-cache-action .

## cmake
  - Type: `string`
  - Allowed values: executable command (path) `cmake`
  - Default value: `cmake`

Sets the `cmake` command used when installing support modules (i.e.
after installation, this particular `cmake` command will support the Pelles
C compiler).

## cmake-module
  - Type: `string`
  - Allowed values: `check | always | no`
  - Default: `check`

### always
Always patching Orange C support modules.

### check
Check availability. Patch Orange C support modules if features are not
supported.

### no
Do not patch the Orange C support modules.

## key-prefix
  - Type: `string`

Add prefix to cache key (for refresh version, identification etc).

## verbose
  - Type: `boolean`
  - Default: `false`

Show the paths and versions of the main components: `occ`, `make`, `cmake`, ...

## version
  - Type: `string`

If not specified, the latest available version is installed.  The list of
available versions is given below:
[https://community.chocolatey.org/packages/orangec](https://community.chocolatey.org/packages/orangec).

# Links
- [OrangeC: Can't create shared library (DLL) with Makefile generators](https://gitlab.kitware.com/cmake/cmake/-/work_items/27716)

# Contributing
Issues or PRs are accepted and welcome.

# Disclaimer
Sorry for my best English.  Alas, this file is actually a yandex translation of
[README.ru.md](README.ru.md) with minimal editorial changes.

# License
[BSD-2-Clause © 2026 Сергей Леонтьев (leo@sai.msu.ru).](LICENSE)

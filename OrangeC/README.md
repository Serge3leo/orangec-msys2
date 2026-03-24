<!-- vim:set sw=4 ts=8 fileencoding=utf8:
 SPDX-License-Identifier: BSD-2-Clause
 SPDX-FileCopyrightText: 2026 Сергей Леонтьев (leo@sai.msu.ru)
 -->

# Patches for Orange C support modules CMake
They patches support for:
- Dynamic libraries;
- Windows resource files `.rc`;
- Selecting C/C++ standards versions.

The installation requires permissions to create and modify files in the
subdirectories `CMAKE_ROOT` of the current CMake.

# Usage
## Install
```powershell
cmake -P OrangeC\install.cmake
```

If not installed, it patch the modules in `CMAKE_ROOT`.

## Uninstall
```powershell
cmake -P OrangeC\uninstall.cmake
```

Undoes module fixes from `CMAKE_ROOT` (up to CRLF).

## Check status
```powershell
cmake -P OrangeC\detect.cmake
```

Checks for feature support for the current CMake.

## Known limitations

- In versions 7.0 and higher, the `--export-all-symbols` key is supported, but
  the rules for creating dynamic libraries do not support the target property
  `WINDOWS_EXPORT_ALL_SYMBOLS` and the variable
  `CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS`.  If necessary, you can manually use the
  `--export-all-symbols` key or use `add_link_options(
  "$<IF:$<BOOL:$<TARGET_PROPERTY:WINDOWS_EXPORT_ALL_SYMBOLS>>,--export-all-symbols,>")`;

- Orange C does not support `.def` export files (you should use either the
  `GenerateExportHeader` module or manually use `__declspec(dllexport)` and
  `__declspec(dllimport)`);

- Support for `.rc` resource files for CMake is only implemented for version
  7.0 or higher.

# Links
Links to CMake issues and/or pull requests will be provided later.

# Disclaimer
Sorry for my best English.  Alas, this file is actually a yandex translation of
[README.ru.md](README.ru.md) with minimal editorial changes.

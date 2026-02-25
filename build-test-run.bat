@echo on
rem vim:set sw=4 ts=8 et fileencoding=utf8:
rem SPDX-License-Identifier: BSD-2-Clause
rem SPDX-FileCopyrightText: 2025 Сергей Леонтьев (leo@sai.msu.ru)

set build_type=Release
set build_output_dir=build\occ
cmake -B %build_output_dir% ^
        -DCMAKE_C_COMPILER=occ ^
        -DCMAKE_CXX_COMPILER=occ ^
        -DCMAKE_BUILD_TYPE=%build_type% ^
        -G "MSYS Makefiles" ^
        -S .
cmake --build %build_output_dir% --config %build_type%
cd %build_output_dir%
ctest --build-config %build_type%
hello
hello++

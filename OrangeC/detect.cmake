# vim:set sw=4 ts=8 et fileencoding=utf8:
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Сергей Леонтьев (leo@sai.msu.ru)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
include(_patches_)

message("detect: CMAKE_ROOT=${CMAKE_ROOT}")
set(fail 0)
ps_detect(OrangeC_1 "${OrangeC_1_detect}" fail)
ps_detect(OrangeC_1 "${OrangeC_2_detect}" fail)
ps_detect(OrangeC_1 "${OrangeC_3_detect}" fail)
ps_detect(OrangeC_C "${OrangeC_C_detect}" fail)
ps_detect(OrangeC_CXX "${OrangeC_CXX_detect}" fail)
if (fail)
    cmake_language(EXIT 1)
endif ()
message("Ok, detect OrangeC_1, OrangeC_C, OrangeC_CXX")
cmake_language(EXIT 0)

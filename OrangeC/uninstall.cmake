# vim:set sw=4 ts=8 et fileencoding=utf8:
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Сергей Леонтьев (leo@sai.msu.ru)

file(REAL_PATH "_ids_.cmake" ids BASE_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}")
include(${ids})

message("detect: CMAKE_ROOT=${CMAKE_ROOT}")
file(READ "${CMAKE_ROOT}/Modules/Compiler/OrangeC.cmake" m)
file(READ "${CMAKE_ROOT}/Modules/Compiler/OrangeC-C.cmake" m_c)
file(READ "${CMAKE_ROOT}/Modules/Compiler/OrangeC-CXX.cmake" m_cxx)

rev_apply_patch("${m}" OrangeC_1 m_n ok)
if (NOT ok)
    message(FATAL_ERROR "Can't apply patch for '${OrangeC_1_detect}'")
endif ()
rev_apply_patch("${m_n}" OrangeC_2 m_n ok)
if (NOT ok)
    message(FATAL_ERROR "Can't apply patch for '${OrangeC_2_detect}'")
endif ()
rev_apply_patch("${m_c}" OrangeC_C m_c_n ok)
if (NOT ok)
    message(FATAL_ERROR "Can't apply patch for '${OrangeC_C_detect}'")
endif ()
rev_apply_patch("${m_cxx}" OrangeC_CXX m_cxx_n ok)
if (NOT ok)
    message(FATAL_ERROR "Can't apply patch for '${OrangeC_CXX_detect}'")
endif ()

save("${CMAKE_ROOT}/Modules/Compiler/OrangeC-CXX.cmake" "pre-uninstall" "${m_cxx_n}")
save("${CMAKE_ROOT}/Modules/Compiler/OrangeC-C.cmake" "pre-uninstall" "${m_c_n}")
save("${CMAKE_ROOT}/Modules/Compiler/OrangeC.cmake" "pre-uninstall" "${m_n}")

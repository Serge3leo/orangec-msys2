# vim:set sw=4 ts=8 et fileencoding=utf8:
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Сергей Леонтьев (leo@sai.msu.ru)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
include(_patches_)

message("install: CMAKE_ROOT=${CMAKE_ROOT}")
file(READ "${CMAKE_ROOT}/Modules/${OrangeC_1_module}" m)
file(READ "${CMAKE_ROOT}/Modules/${OrangeC_C_module}" m_c)
file(READ "${CMAKE_ROOT}/Modules/${OrangeC_CXX_module}" m_cxx)
set(fail 0)
ps_apply_patch("${m}" OrangeC_1 m_n fail)
ps_apply_patch("${m_n}" OrangeC_2 m_n fail)
ps_apply_patch("${m_n}" OrangeC_3 m_n fail)
ps_apply_patch("${m_c}" OrangeC_C m_c_n fail)
ps_apply_patch("${m_cxx}" OrangeC_CXX m_cxx_n fail)
if (fail)
    message(FATAL_ERROR "Can't install all patches")
endif ()
ps_save("${CMAKE_ROOT}/Modules/${OrangeC_CXX_module}" "pre-install" "${m_cxx_n}")
ps_save("${CMAKE_ROOT}/Modules/${OrangeC_C_module}" "pre-install" "${m_c_n}")
ps_save("${CMAKE_ROOT}/Modules/${OrangeC_1_module}" "pre-install" "${m_n}")

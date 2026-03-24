# vim:set sw=2 ts=8 et fileencoding=utf8:
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Сергей Леонтьев (leo@sai.msu.ru)

include(_support_)

set(OrangeC_1_module "Compiler/OrangeC.cmake")
set(OrangeC_1_match "(macro\\(__compiler_orangec lang\\)[ \t]*\n)")
set(OrangeC_1_replace [=[\1  # orangec-setup patch1
  if (lang STREQUAL ASM)
    set(_ORANGEC_COMPILE_${lang} " -x asm")
  elseif (lang STREQUAL C)
    set(_ORANGEC_COMPILE_${lang} " -x c")
  endif ()
  # orangec-setup patch1 end

]=])
set(OrangeC_1_rev_match "${OrangeC_1_match}.*patch[^\n]* end\n\n")
set(OrangeC_1_rev_replace "\\1")
set(OrangeC_1_detect "_ORANGEC_COMPILE_.*-x")

set(OrangeC_2_module "${OrangeC_2_module}:2")
set(OrangeC_2_match "_COMPILER> -! <FLAGS> -o <TARGET> --out-implib <TARGET_IMPLIB> <CMAKE_SHARED_LIBRARY_")
set(OrangeC_2_replace "_COMPILER> -! -o <TARGET> --out-implib <TARGET_IMPLIB> <CMAKE_SHARED_LIBRARY_")
set(OrangeC_2_rev_match ${OrangeC_2_replace})
set(OrangeC_2_rev_replace ${OrangeC_2_match})
set(OrangeC_2_detect ${OrangeC_2_replace})

set(OrangeC_3_module "${OrangeC_1_module}:3")
set(OrangeC_3_match "([ \t]+set.CMAKE_.{lang}_RESPONSE_FILE_LINK_FLAG \"@\".[ \t]*\n)([ \t]*endmacro\\(\\)[ \t]*\n)")
set(OrangeC_3_replace [=[\1
  # orangec-setup patch3
  if (CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL "7.0")
    if (NOT CMAKE_RC_COMPILER_INIT)
      set(CMAKE_RC_COMPILER_INIT orc)
    endif ()
    if (NOT CMAKE_RC_COMPILE_OBJECT)
      set(CMAKE_RC_COMPILE_OBJECT
        "<CMAKE_RC_COMPILER> -! <DEFINES> <INCLUDES> <FLAGS> -o<OBJECT> <SOURCE>")
    endif ()
    enable_language(RC)
    if ("${CMAKE_RC_COMPILER}" MATCHES "(^|[/\\])[oO][rR][cC]")
      set(CMAKE_INCLUDE_FLAG_RC -i)
    endif ()
  endif ()
\2]=])
set(OrangeC_3_rev_match "([ \t]+set.CMAKE_.{lang}_RESPONSE_FILE_LINK_FLAG \"@\".[ \t]*\n).*#.*patch.*\n([ \t]*endmacro\\(\\)[ \t]*\n)")
set(OrangeC_3_rev_replace "\\1\\2")
set(OrangeC_3_detect "CMAKE_RC_COMPILER")

set(OrangeC_C_module "Compiler/OrangeC-C.cmake")
set(OrangeC_C_match "(\n)([ \t]*__compiler_orangec\\(C\\)[ \t]*\n)")
set(OrangeC_C_replace [=[\1# orangec-setup patch
if (CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL "6.0.71")
  set(CMAKE_C23_STANDARD_COMPILE_OPTION -2)
  set(CMAKE_C23_EXTENSION_COMPILE_OPTION -2)

  set(CMAKE_C_STANDARD_LATEST 23)
endif ()
\n\2]=])
set(OrangeC_C_rev_match "(\n)[^\n]*#[^\n]*patch.*\n([ \t]*__compiler_orangec\\(C\\)[ \t]*\n)")
set(OrangeC_C_rev_replace "\\1\\2")
set(OrangeC_C_detect "CMAKE_C23_STANDARD_COMPILE_OPTION")

set(OrangeC_CXX_module "Compiler/OrangeC-CXX.cmake")
set(OrangeC_CXX_match "(\n)([ \t]*__compiler_orangec\\(CXX\\)[ \t]*\n)")
set(OrangeC_CXX_replace [=[\1# orangec-setup patch
if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "7.0")
  set(CMAKE_CXX17_STANDARD_COMPILE_OPTION "-std=c++17")
  set(CMAKE_CXX17_EXTENSION_COMPILE_OPTION "-std=c++17")
  set(CMAKE_CXX17_STANDARD__HAS_FULL_SUPPORT ON)

  set(CMAKE_CXX_STANDARD_LATEST 17)
endif ()
\n\2]=])
set(OrangeC_CXX_rev_match "(\n)[^\n]*#[^\n]*patch.*\n([ \t]*__compiler_orangec\\(CXX\\)[ \t]*\n)")
set(OrangeC_CXX_rev_replace "\\1\\2")
set(OrangeC_CXX_detect "CMAKE_CXX17_STANDARD_COMPILE_OPTION")

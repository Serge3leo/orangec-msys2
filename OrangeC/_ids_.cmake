# vim:set sw=2 ts=8 et fileencoding=utf8:
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-FileCopyrightText: 2026 Сергей Леонтьев (leo@sai.msu.ru)

# Compiler/OrangeC.cmake

set(OrangeC_1_match "_COMPILER> -! <FLAGS> -o <TARGET> --out-implib <TARGET_IMPLIB> <CMAKE_SHARED_LIBRARY_")
set(OrangeC_1_replace "_COMPILER> -! -o <TARGET> --out-implib <TARGET_IMPLIB> <CMAKE_SHARED_LIBRARY_")
set(OrangeC_1_rev_match ${OrangeC_1_replace})
set(OrangeC_1_rev_replace ${OrangeC_1_match})
set(OrangeC_1_detect ${OrangeC_1_replace})

set(OrangeC_2_match "([ \t]+set.CMAKE_.{lang}_RESPONSE_FILE_LINK_FLAG \"@\".[ \t]*\n)([ \t]*endmacro\\(\\)[ \t]*\n)")
set(OrangeC_2_replace [=[\1
  # orangec-msys2 patch
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
\2]=])
set(OrangeC_2_rev_match "([ \t]+set.CMAKE_.{lang}_RESPONSE_FILE_LINK_FLAG \"@\".[ \t]*\n).*#.*patch.*\n([ \t]*endmacro\\(\\)[ \t]*\n)")
set(OrangeC_2_rev_replace "\\1\\2")
set(OrangeC_2_detect "CMAKE_RC_COMPILER")

# Compiler/OrangeC-C.cmake

set(OrangeC_C_match "(\n)([ \t]*__compiler_orangec\\(C\\)[ \t]*\n)")
set(OrangeC_C_replace [=[\1# orangec-msys2 patch
if (CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL "6.0.71")
  set(CMAKE_C23_STANDARD_COMPILE_OPTION -2)
  set(CMAKE_C23_EXTENSION_COMPILE_OPTION -2)

  set(CMAKE_C_STANDARD_LATEST 23)
endif ()
\n\2]=])
set(OrangeC_C_rev_match "(\n)[^\n]*#[^\n]*patch.*\n([ \t]*__compiler_orangec\\(C\\)[ \t]*\n)")
set(OrangeC_C_rev_replace "\\1\\2")
set(OrangeC_C_detect "CMAKE_C23_STANDARD_COMPILE_OPTION")


# Compiler/OrangeC-CXX.cmake

set(OrangeC_CXX_match "(\n)([ \t]*__compiler_orangec\\(CXX\\)[ \t]*\n)")
set(OrangeC_CXX_replace [=[\1# orangec-msys2 patch
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

function (apply_patch in patch out ok)
  if (in MATCHES "${${patch}_detect}")
    message(SEND_ERROR "apply_patch: matched '${${patch}_detect}'")
    set(${ok} FALSE PARENT_SCOPE)
    return ()
endif ()
  string(REGEX REPLACE "${${patch}_match}" "${${patch}_replace}"
         repl "${in}")
  if (NOT repl MATCHES "${${patch}_detect}")
    message(SEND_ERROR "apply_patch: don't replaced for '${${patch}_detect}'")
    message("repl=${repl}")
    set(${ok} FALSE PARENT_SCOPE)
    return ()
  endif ()
  string(REGEX REPLACE "${${patch}_rev_match}" "${${patch}_rev_replace}"
         cmp "${repl}")
  if (NOT in STREQUAL cmp)
    message(SEND_ERROR "apply_patch: patch don't reversible '${${patch}_detect}'")
    message("in: -----\n${in}-----")
    message("cmp: =====\n${cmp}=====")
    set(${ok} FALSE PARENT_SCOPE)
    return ()
  endif ()
  set(${out} "${repl}" PARENT_SCOPE)
  set(${ok} TRUE PARENT_SCOPE)
endfunction ()

function (rev_apply_patch in patch out ok)
  if (NOT in MATCHES "${${patch}_detect}")
    message(SEND_ERROR "rev_apply_patch: don't matched '${${patch}_detect}'")
    set(${ok} FALSE PARENT_SCOPE)
    return ()
  endif ()
  string(REGEX REPLACE "${${patch}_rev_match}" "${${patch}_rev_replace}"
         repl "${in}")
  if (repl MATCHES "${${patch}_detect}")
    message(SEND_ERROR "rev_apply_patch: don't replaced for '${${patch}_detect}'")
    message("repl=${repl}")
    set(${ok} FALSE PARENT_SCOPE)
    return ()
  endif ()
  string(REGEX REPLACE "${${patch}_match}" "${${patch}_replace}"
         cmp "${repl}")
  if (NOT in STREQUAL cmp)
    message(SEND_ERROR "rev_apply_patch: patch don't reversible '${${patch}_detect}'")
    message("in: -----\n${in}-----")
    message("cmp: =====\n${cmp}=====")
    set(${ok} FALSE PARENT_SCOPE)
    return ()
  endif ()
  set(${out} "${repl}" PARENT_SCOPE)
  set(${ok} TRUE PARENT_SCOPE)
endfunction ()

function (save filename suffix content)
  file(RENAME "${filename}" "${filename}.${suffix}")
  file(WRITE "${filename}" "${content}")
endfunction ()

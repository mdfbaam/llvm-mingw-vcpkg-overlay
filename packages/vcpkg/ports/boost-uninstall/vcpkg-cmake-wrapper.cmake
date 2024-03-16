set(Boost_USE_STATIC_LIBS OFF)
set(Boost_USE_MULTITHREADED ON)
unset(Boost_USE_STATIC_RUNTIME)
set(Boost_NO_BOOST_CMAKE ON)
unset(Boost_USE_STATIC_RUNTIME CACHE)
if("${CMAKE_VS_PLATFORM_TOOLSET}" STREQUAL "v120")
    set(Boost_COMPILER "-vc120")
else()
    set(Boost_COMPILER "-vc140")
endif()

if(
    ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang") AND
    (
        ("${VCPKG_TARGET_TRIPLET}" STREQUAL "x64-mingw-llvm-static") OR
        ("${VCPKG_TARGET_TRIPLET}" STREQUAL "x64-mingw-llvm-dynamic")
    )
)
    string(REPLACE "." ";" VERSION_LIST ${CMAKE_CXX_COMPILER_VERSION})
    list(GET VERSION_LIST 0 CLANG_VERSION_MAJOR)
    list(GET VERSION_LIST 1 CLANG_VERSION_MINOR)
    list(GET VERSION_LIST 2 CLANG_VERSION_PATCH)

    set(Boost_COMPILER "-clang${CLANG_VERSION_MAJOR}")
endif()

_find_package(${ARGS})

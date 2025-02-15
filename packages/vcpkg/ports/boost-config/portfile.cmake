# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/config
    REF boost-${VERSION}
    SHA512 93997394385d468832cc867fd74f74ead25c11a387c04fd56e88da906394e4131cb290f69e7754dba74eebdd053ca172051b6917060b010c928507f7a7382219
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
#file(APPEND ${CURRENT_PACKAGES_DIR}/include/boost/config/user.hpp "\n#ifndef BOOST_ALL_NO_LIB\n#define BOOST_ALL_NO_LIB\n#endif\n")
#file(APPEND ${CURRENT_PACKAGES_DIR}/include/boost/config/user.hpp "\n#undef BOOST_ALL_DYN_LINK\n")

#if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
#    file(APPEND ${CURRENT_PACKAGES_DIR}/include/boost/config/user.hpp "\n#define BOOST_ALL_DYN_LINK\n")
#endif()
file(COPY ${SOURCE_PATH}/checks DESTINATION ${CURRENT_PACKAGES_DIR}/share/boost-config)

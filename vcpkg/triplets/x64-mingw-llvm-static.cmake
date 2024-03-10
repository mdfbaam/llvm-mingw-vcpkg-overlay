set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_ENV_PASSTHROUGH PATH)

get_filename_component(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${CMAKE_CURRENT_LIST_DIR}/../toolchains/llvm-mingw.cmake" ABSOLUTE)

#set(VCPKG_POLICY_DLLS_WITHOUT_LIBS enabled)
#set(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)

set(VCPKG_TARGET_IS_LLVM_MINGW ON)
set(VCPKG_LLVM_MINGW_TOOLCHAIN_VERSION 18)
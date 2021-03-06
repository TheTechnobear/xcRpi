

message("using xc-rpi-toolchain")
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(triple arm-linux-gnueabihf)

if(APPLE)
    set(CMAKE_C_COMPILER /usr/local/opt/llvm/bin/clang)
    set(CMAKE_CXX_COMPILER /usr/local/opt/llvm/bin/clang++)
    # set(tools /usr/local/opt/arm-linux-gnueabihf-binutils)
else()
    set(CMAKE_C_COMPILER /usr/bin/clang-10)
    set(CMAKE_CXX_COMPILER /usr/bin/clang++-10)
    # set(tools /usr/local/arm-linux-gnueabihf-binutils) ?
endif()

set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_CXX_COMPILER_TARGET ${triple})

if(DEFINED ENV{<XC_ROOT>})
    set(XC_ROOT ENV{<XC_ROOT>})
    message("using envvar XC_ROOT  - ${XC_ROOT}")
else()
    message("defaulting XC_ROOT to ~/xcRpi")
    get_filename_component(XC_ROOT "~/xcRpi" ABSOLUTE)
    message("using envvar XC_ROOT  - ${XC_ROOT}")
endif()

set(XC_SYSROOT ${XC_ROOT}/sysroot)
set(CMAKE_SYSROOT ${XC_SYSROOT})


set(RPI_LINK_FLAGS "${RPI_LINK_FLAGS} -L${XC_SYSROOT}/usr/local/lib " ) 
set(RPI_LINK_FLAGS "${RPI_LINK_FLAGS} -lasound -ldl") 
set(RPI_LINK_FLAGS "${RPI_LINK_FLAGS} -L${XC_SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/6.3.0  -B${XC_SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/6.3.0  -latomic")
set(RPI_LINK_FLAGS "${RPI_LINK_FLAGS} -Wl,-rpath-link,${XC_SYSROOT}/lib/arm-linux-gnueabihf")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${RPI_LINK_FLAGS}")
set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} ${RPI_LINK_FLAGS}")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${RPI_LINK_FLAGS}")

# possibily useful?
# set(CMAKE_STAGING_PREFIX /home/devel/stage)
# set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
# set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
# set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

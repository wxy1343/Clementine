
macro(fetch_googletest _download_module_path _download_root)
    set(GOOGLETEST_DOWNLOAD_ROOT ${_download_root})
    configure_file(
        ${_download_module_path}/googletest-download.cmake
        ${_download_root}/CMakeLists.txt
        @ONLY
        )
    unset(GOOGLETEST_DOWNLOAD_ROOT)

    execute_process(
        COMMAND
            "${CMAKE_COMMAND}" -G "${CMAKE_GENERATOR}" .
        WORKING_DIRECTORY
            ${_download_root}
        )
    execute_process(
        COMMAND
            "${CMAKE_COMMAND}" --build .
        WORKING_DIRECTORY
            ${_download_root}
        )

    add_subdirectory(
        ${_download_root}/googletest
        ${_download_root}/googletest/build
        )

    include_directories(${_download_root}/googletest/googletest/include)
endmacro()
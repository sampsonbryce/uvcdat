set (OPENSSL_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/build/openssl")
set (OPENSSL_INSTALL_DIR "${cdat_EXTERNALS}")

execute_process (COMMAND uname -s COMMAND tr -d '\n'
                 OUTPUT_VARIABLE HOST)
STRING (TOLOWER ${HOST} HOST)
execute_process (COMMAND uname -m COMMAND tr -d '\n'
                 OUTPUT_VARIABLE ARCHITECTURE)

get_filename_component (COMPILER "${CMAKE_C_COMPILER}" NAME_WE)

if (APPLE)
  if (ARCHITECTURE MATCHES "64$")
    set (HOST "${HOST}64")
  endif ()
  set (COMPILER "cc")
endif ()

set (OPENSSL_CONF_ARGS "${HOST}-${ARCHITECTURE}-${COMPILER}")
set (OPENSSL_CONF_ARGS
    ${OPENSSL_CONF_ARGS}
    "--prefix=${OPENSSL_INSTALL_DIR}")

ExternalProject_Add (openssl
  DOWNLOAD_DIR ${CDAT_PACKAGE_CACHE_DIR}
  SOURCE_DIR ${OPENSSL_SOURCE_DIR}
  INSTALL_DIR ${OPENSSL_INSTALL_DIR}
  URL ${OPENSSL_SOURCE_URL}
  URL_MD5 ${OPENSSL_MD5}
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND ${OPENSSL_SOURCE_DIR}/Configure ${OPENSSL_CONF_ARGS}
  DEPENDS ${OPENSSL_DEPS}
  ${ep_log_options}
  )

set (OPENSSL_INCLUDE_DIR "${OPENSSL_INSTALL_DIR}/include")
set (OPENSSL_LIBRARY_DIR "${OPENSSL_INSTALL_DIR}/lib")

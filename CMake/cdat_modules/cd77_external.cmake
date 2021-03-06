# create an external project to install cd77
# and configure and build it

ExternalProject_Add(cd77
  DOWNLOAD_DIR ${CDAT_PACKAGE_CACHE_DIR}
  SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/build/cd77
  ${GIT_CMD_STR_cd77}
  ${GIT_TAG_cd77}
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND env LD_LIBRARY_PATH=$ENV{LD_LIBRARY_PATH} CFLAGS=$ENV{CFLAGS} LDFLAGS=$ENV{LDFLAGS} PKG_CONFIG_PATH=$ENV{PKG_CONFIG_PATH} PYTHONPATH=${PYTHONPATH} ${USR_ENVS} ${PYTHON_EXECUTABLE} setup.py install ${USER_INSTALL_OPTIONS} ${PRFX}
  DEPENDS ${${nm}_deps}
  ${ep_log_options}
)


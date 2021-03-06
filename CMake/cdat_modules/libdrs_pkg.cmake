set(LIBDRS_VERSION 1.0.0)
set(LIBDRS_URL ${LLNL_URL})
set(LIBDRS_BRANCH master)
set(LIBDRS_REPOSITORY ${GIT_PROTOCOL}github.com/UV-CDAT/libdrs.git )

set(GIT_CMD_STR_LIBDRS GIT_REPOSITORY ${LIBDRS_REPOSITORY})
set(GIT_TAG GIT_TAG "${LIBDRS_BRANCH}")
if (CDAT_BUILD_PCMDI)
  set(CDAT_BUILD_LIBDRS ON)
  add_cdat_package(libdrs "" "" ON)
endif()

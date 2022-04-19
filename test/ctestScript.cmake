message(STATUS "ctestroot=${CTEST_DASHBOARD_ROOT}")
SET (CTEST_BINARY_DIRECTORY  "${CTEST_DASHBOARD_ROOT}/../bin")
SET(CTEST_SOURCE_DIRECTORY  "${CTEST_DASHBOARD_ROOT}/../../../src")
set(CTEST_COMMAND "G:/Programming/python/pjap/build/release/test/Test_test.exe")
SET (CTEST_PROJECT_NAME "Test_test")

include()
#ctest_coverage()
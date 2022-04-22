include(./build/.dump/CTestTestfile.cmake)

file(GLOB GCOVFILE build/.dump/CMakeFiles/*.dir/src/*.gcno)


foreach(gcovfile ${GCOVFILE})
    message("gcovefolder=${gcovfile}")
    exec_program(gcovr ARGS ${gcovfile} -r . -f src --html-details Docs/Coverage/Html/coverage.html --sonarqube Docs/Coverage/Sonarqube/coverage.yml -o gcovfile/gcov)
endforeach()

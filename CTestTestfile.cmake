include(./build/release/dump/CTestTestfile.cmake)

file(GLOB GCOVFILE build/release/dump/CMakeFiles/*.dir/src)

foreach(gcovfile ${GCOVFILE})
    message("gcovefolder=${gcovfile}")
    exec_program(gcovr ARGS ${gcovfile} -r . -f src --html-details Docs/Coverage/Html/coverage.html --sonarqube Docs/Coverage/Sonarqube/coverage.yml -o gcovfile/gcov)
endforeach()

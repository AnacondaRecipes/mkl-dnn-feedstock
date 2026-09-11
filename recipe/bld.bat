set CMAKE_POLICY_VERSION_MINIMUM=3.5
mkdir build && cd build

cmake -G"%CMAKE_GENERATOR%" ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=ON ^
  -DMKLROOT="%LIBRARY_PREFIX%" ^
  %SRC_DIR%
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

ctest

cmake --build . --target install
if errorlevel 1 exit 1

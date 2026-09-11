#!/usr/bin/env bash

set -x

export CMAKE_POLICY_VERSION_MINIMUM=3.5

cmake -G"$CMAKE_GENERATOR" \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR="lib" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=ON \
  -DMKLROOT="${PREFIX}" \
  ${SRC_DIR}

cmake --build . --config Release -j${CPU_COUNT}

ctest

cmake --build . --target install

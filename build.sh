#!/bin/bash

cd /code
cmake -B build
cmake --build build/resources/etesync
cd build/resources/etesync
checkinstall --install=no

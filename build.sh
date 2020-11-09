#!/bin/bash

cd /kdepim-runtime-etesync-20.08
cmake -B build
cmake --build build/resources/etesync
cd build/resources/etesync
checkinstall

#!/bin/bash

rm -rf build

python3 setup.py $1 bdist bdist_wheel

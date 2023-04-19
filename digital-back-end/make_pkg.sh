#!/bin/bash

rm -rf build

python3 setup.py custom bdist bdist_wheel

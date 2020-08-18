#!/bin/bash
# Clone files to Github - https://github.com/talesCPV/maps.git

git init

git clone https://github.com/talesCPV/maps.git

cd maps/

cp -rf * ../

cd ..

rm -rf maps/




#!/bin/sh

set -x

rm -f src/Quarter/moc_*.cpp
rm -f quarter1.sln
rm -f *.vcproj

cp ../msvc6/*.dsw .
cp ../msvc6/*.dsp .

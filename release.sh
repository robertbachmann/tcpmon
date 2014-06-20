#!/usr/bin/env bash

cd $(dirname $0)

rm -fr target
mvn clean package
cd target

BASENAME=$(basename *.jar .jar)
VER=$(echo $BASENAME | cut -d'-' -f2-)
mkdir tcpmon-$VER
cp *.jar tcpmon-$VER
sed -e 's/$/\r/g' < ../README.md > tcpmon-$VER/README.txt
sed -e 's/$/\r/g' < ../LICENSE.txt > tcpmon-$VER/LICENSE.txt

7za a -tzip tcpmon-$VER.zip tcpmon-$VER

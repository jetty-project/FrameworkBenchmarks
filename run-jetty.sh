#!/bin/bash

ENVID=`./envinfo.sh`
VERSIONS=`cat jetty-versions.txt | sed -e "/^#/d"`

for VER in $VERSIONS
do
  echo $VER
  cat frameworks/Java/jetty/pom-template.xml | sed -e "s/@JETTYVER@/$VER/g" > frameworks/Java/jetty/pom.xml
  grep jetty.version\> frameworks/Java/jetty/pom.xml
  ./tfb --mode benchmark --results-name=$VER --results-environment="$ENVID" --test jetty
done


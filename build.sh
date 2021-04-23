#!/bin/sh
# Compiles to Java classes, builds a jar, and then compiles to a native Linux executable 

set -e

mkdir -p dist
sbt clean assembly
docker build -f linuxbuild.dockerfile -t linuxbuild --build-arg BASE_IMAGE_TAG="java11-21.0.0" .
docker run --rm -v "$(pwd -P)/target/scala-2.13":/tmp/target -v "$(pwd -P)/dist":/tmp/dist linuxbuild

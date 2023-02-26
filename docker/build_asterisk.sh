#!/bin/bash

# Сборка контейнера Asterisk 18.16.0

version=18.16.0

echo Build docker of Asterisk, version: ${version}

docker build -t anydict/asterisk:${version} \
-f Dockerfile .


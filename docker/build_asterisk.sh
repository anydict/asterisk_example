#!/bin/bash

# Сборка контейнера Asterisk 20.2.0

version=20.2.0

echo Build docker of Asterisk, version: ${version}

docker build -t anydict/asterisk:${version} \
-f Dockerfile .


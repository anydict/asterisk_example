#!/bin/bash

# Build image Asterisk 20.9.2

version=20.9.2

echo Build docker of Asterisk, version: ${version}

docker build -t anydict/asterisk20ubuntu22:${version} -f Dockerfile .
### For full build use line below and replace line above:
# docker build -t anydict/asterisk20ubuntu22:${version} -f Dockerfile_source .
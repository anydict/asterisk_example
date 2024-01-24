#!/bin/bash

# Build image Asterisk 20.6.0

version=20.6.0

echo Build docker of Asterisk, version: ${version}

docker build -t anydict/asterisk:${version} -f Dockerfile .
### For full build use line below and replace line above:
# docker build -t anydict/asterisk:${version} -f Dockerfile_source .
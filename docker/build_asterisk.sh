#!/bin/bash

# Build image Asterisk 20.5.0

version=20.5.0

echo Build docker of Asterisk, version: ${version}

docker build -t anydict/asterisk:${version} -f Dockerfile .
### For full build use line below and replace line above:
# -f Dockerfile_source .

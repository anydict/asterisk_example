#!/bin/bash

# Build image Asterisk 20.8.1 with PJSIP

version=20.8.1

echo Build docker of Asterisk, version: ${version}

# docker build -t anydict/asterisk_pjsip_ubuntu24:${version} -f Dockerfile .
### For full build use line below and replace line above:
docker build -t anydict/asterisk_pjsip_ubuntu24:${version} -f Dockerfile_source .

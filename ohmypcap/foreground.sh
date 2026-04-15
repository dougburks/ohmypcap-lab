#!/bin/bash

mkdir -p ~/ohmypcap-data
chmod 777 ~/ohmypcap-data

docker run \
  --name ohmypcap \
  -v ~/ohmypcap-data:/data \
  -p 8000:8000 \
  ghcr.io/dougburks/ohmypcap:main

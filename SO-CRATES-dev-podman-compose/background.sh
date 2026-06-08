#!/bin/bash

set -euo pipefail

DEBIAN_FRONTEND=noninteractive apt-get update -qq
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends podman-compose

touch /tmp/setup_complete

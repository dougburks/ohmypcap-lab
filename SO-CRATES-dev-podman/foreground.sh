##############################################
# Installing podman
##############################################
apt -y install podman

##############################################
# Downloading and running SO-CRATES DEV
##############################################
podman run --name so-crates -e DEMO=1 -p 8000:8000 ghcr.io/dougburks/ohmypcap:dev

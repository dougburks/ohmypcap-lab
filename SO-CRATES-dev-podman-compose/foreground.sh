########################################################
# Setting up podman-compose (this may take a minute)...
########################################################

while [ ! -f /tmp/setup_complete ]; do
  sleep 1
done

########################################################
# Downloading and running SO-CRATES DEV
########################################################
wget https://raw.githubusercontent.com/dougburks/so-crates/refs/heads/dev/docker-compose.yml
sed -i 's|ghcr.io/dougburks/so-crates:main|ghcr.io/dougburks/so-crates:dev|g' docker-compose.yml
# The compose file publishes on localhost only by default; Killercoda's
# traffic proxy connects over the VM's real interface, so publish wide here.
sed -i 's|127.0.0.1:8000:8000|8000:8000|' docker-compose.yml
mkdir socrates-data
chmod 777 socrates-data
# Env via a compose override rather than appending to the downloaded file -
# survives upstream reordering of docker-compose.yml. ALLOWED_HOSTS accepts
# Killercoda's per-session traffic hostname (see the SO-CRATES security docs).
cat <<EOF >docker-compose.override.yml
services:
  so-crates:
    environment:
      DEMO: "1"
      ALLOWED_HOSTS: "*.killercoda.com"
EOF
podman-compose up

##############################################
# Downloading and running SO-CRATES DEV
##############################################
wget https://raw.githubusercontent.com/dougburks/ohmypcap/refs/heads/dev/docker-compose.yml
sed -i 's|ghcr.io/dougburks/so-crates:main|ghcr.io/dougburks/ohmypcap:dev|g' docker-compose.yml
mkdir socrates-data
chmod 777 socrates-data
cat <<EOF >>.env
DEMO=1
EOF
cat <<EOF >>docker-compose.yml
    env_file:
      - .env
EOF
docker-compose up

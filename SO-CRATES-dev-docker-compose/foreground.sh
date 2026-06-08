##############################################
# Downloading and running SO-CRATES DEV
##############################################
wget https://raw.githubusercontent.com/dougburks/ohmypcap/refs/heads/dev/docker-compose.yml
mkdir socrates-data
chmod 777 socrates-data
docker-compose up -e DEMO=1

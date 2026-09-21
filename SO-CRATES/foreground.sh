##############################################
# Downloading and running SO-CRATES!
##############################################
docker run --name so-crates -e DEMO=1 -e ALLOWED_HOSTS='*.killercoda.com' -p 8000:8000 ghcr.io/dougburks/so-crates:main

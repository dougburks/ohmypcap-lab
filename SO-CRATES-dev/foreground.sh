##############################################
# Let's get ready for SO-CRATES DEV!
##############################################

##############################################
# Creating data directory
##############################################
mkdir -p ~/socrates-data && chmod 777 ~/socrates-data

##############################################
# Downloading and running SO-CRATES
##############################################
docker run --name so-crates -e DEMO=1 -v ~/socrates-data:/data -p 8000:8000 ghcr.io/dougburks/ohmypcap:dev

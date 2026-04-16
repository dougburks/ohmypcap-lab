##############################################
# Let's get ready for OhMyPCAP!
##############################################

##############################################
# Creating data directory
##############################################
mkdir -p ~/ohmypcap-data && chmod 777 ~/ohmypcap-data

##############################################
# Downloading and running OhMyPCAP
##############################################
docker run --name ohmypcap -v ~/ohmypcap-data:/data -p 8000:8000 ghcr.io/dougburks/ohmypcap:main

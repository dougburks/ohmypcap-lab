##############################################
# Getting ready to start OhMyPCAP!
##############################################

##############################################
# Creating data directory for docker image
##############################################
mkdir -p ~/ohmypcap-data && chmod 777 ~/ohmypcap-data

##############################################
# Running docker image
##############################################
docker run --name ohmypcap -v ~/ohmypcap-data:/data -p 8000:8000 ghcr.io/dougburks/ohmypcap:main

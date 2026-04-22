##############################################
# Let's get ready for OhMyPCAP on Kubernetes!
##############################################

##############################################
# Downloading and running OhMyPCAP
##############################################
kubectl run ohmypcap --image=ghcr.io/dougburks/ohmypcap:main

##############################################
# Exposing pod
##############################################
kubectl expose pod ohmypcap --port 8000 --name ohmypcap

##############################################
# Waiting for rule update and service start
##############################################
kubectl wait --for=condition=ready pod ohmypcap --timeout=5m

##############################################
# Forwarding port 8000
##############################################
sleep 1s
kubectl port-forward --address 0.0.0.0 service/ohmypcap 8000:8000

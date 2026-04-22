##############################################
# Let's get ready for OhMyPCAP on Kubernetes!
##############################################

##############################################
# Downloading and running OhMyPCAP
##############################################
kubectl run ohmypcap --image=ghcr.io/dougburks/ohmypcap:main
kubectl expose pod ohmypcap --port 8000 --name ohmypcap
kubectl wait --for=condition=ready pod ohmypcap

##############################################
# Forwarding port 8000
##############################################
kubectl port-forward --address 0.0.0.0 service/ohmypcap 8000:8000

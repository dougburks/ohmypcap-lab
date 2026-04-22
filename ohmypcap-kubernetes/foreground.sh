##############################################
# Let's get ready for OhMyPCAP on Kubernetes!
##############################################

##############################################
# Downloading and running OhMyPCAP
##############################################
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: ohmypcap
  labels:
    app: ohmypcap
spec:
  containers:
    - name: ohmypcap
      image: ghcr.io/dougburks/ohmypcap:main
      ports:
        - containerPort: 8000
      readinessProbe:
        httpGet:
          path: /
          port: 8000
        initialDelaySeconds: 5
        periodSeconds: 5
---
apiVersion: v1
kind: Service
metadata:
  name: ohmypcap
spec:
  selector:
    app: ohmypcap
  ports:
    - port: 8000
      targetPort: 8000
EOF

##############################################
# Waiting for rule update and service start
# This may take a minute or two
##############################################
kubectl wait --for=condition=ready pod ohmypcap --timeout=5m

##############################################
# Forwarding port 8000
##############################################
kubectl port-forward --address 0.0.0.0 service/ohmypcap 8000:8000

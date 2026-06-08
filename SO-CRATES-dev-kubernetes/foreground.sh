##############################################
# Let's get ready for SO-CRATES on Kubernetes!
##############################################

##############################################
# Downloading and running SO-CRATES
##############################################
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: so-crates
  labels:
    app: so-crates
spec:
  containers:
    - name: so-crates
      image: ghcr.io/dougburks/ohmypcap:dev
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
  name: so-crates
spec:
  selector:
    app: so-crates
  ports:
    - port: 8000
      targetPort: 8000
EOF

##############################################
# Waiting for rule update and service start
# This may take a minute or two
##############################################
kubectl wait --for=condition=ready pod so-crates --timeout=5m

##############################################
# Forwarding port 8000
##############################################
kubectl port-forward --address 0.0.0.0 service/so-crates 8000:8000

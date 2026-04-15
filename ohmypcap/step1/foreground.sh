#!/bin/bash

echo "🚀 Starting automatic OhMyPCAP setup..."

echo "[1/5] Updating package index..."
apt-get update -qq

echo "[2/5] Installing Docker (non-interactive)..."
DEBIAN_FRONTEND=noninteractive \
  apt-get install -y docker.io

echo "[3/5] Configuring Docker group..."
usermod -aG docker root

echo "[4/5] Preparing data directory..."
rm -rf ~/ohmypcap-data
mkdir -p ~/ohmypcap-data
chmod 777 ~/ohmypcap-data

echo "[5/5] Starting OhMyPCAP container..."
docker rm -f ohmypcap 2>/dev/null || true

docker run -d \
  --name ohmypcap \
  -v ~/ohmypcap-data:/data \
  -p 8000:8000 \
  ghcr.io/dougburks/ohmypcap:main

echo "[5/5] Waiting for OhMyPCAP to initialize..."
for i in {1..18}; do
  echo -n "."
  sleep 1
done
echo ""

echo ""
echo "✅ Setup completed successfully!"
echo "🎉 OhMyPCAP is now running on port 8000"
echo ""
echo "Proceed to the next step to verify and open the web interface."

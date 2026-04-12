#!/bin/bash
set -e

echo "🔍 Performing final verification..."

if ! docker info >/dev/null 2>&1; then
  echo "❌ Docker is not available"
  exit 1
fi
echo "✅ Docker is running"

if ! docker ps | grep -q ohmypcap; then
  echo "❌ OhMyPCAP container is not running"
  exit 1
fi
echo "✅ OhMyPCAP container is running"

if ! ss -tuln | grep -q ":8000"; then
  echo "❌ Port 8000 is not listening"
  exit 1
fi
echo "✅ Port 8000 is listening"

if docker logs ohmypcap 2>&1 | grep -q "PermissionError"; then
  echo "❌ Permission error detected"
  exit 1
fi
echo "✅ No permission errors"

echo ""
echo "🎉 All checks passed! OhMyPCAP is ready."
echo "→ Open the Web Preview and navigate to /ohmypcap.html"

#!/bin/bash
set -e

echo "Cleaning VM before image capture..."

sudo rm -f /tmp/cis-results.xml /tmp/cis-report.html
sudo waagent -deprovision+user -force || true

echo "Cleanup complete."
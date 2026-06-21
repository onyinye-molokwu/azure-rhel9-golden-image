#!/bin/bash
set -e

echo "Starting RHEL 9 hardening baseline..."

sudo dnf update -y
sudo dnf install -y openscap-scanner scap-security-guide aide audit rsyslog firewalld

sudo systemctl enable --now firewalld
sudo systemctl enable --now auditd
sudo systemctl enable --now rsyslog

sudo systemctl set-default multi-user.target

sudo oscap xccdf eval \
  --profile xccdf_org.ssgproject.content_profile_cis_server_l1 \
  --results /tmp/cis-results.xml \
  --report /tmp/cis-report.html \
  /usr/share/xml/scap/ssg/content/ssg-rhel9-ds.xml || true

echo "Hardening baseline complete."
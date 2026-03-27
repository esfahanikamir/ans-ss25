#!/bin/bash

set -e

echo "[+] Installing virtualization and Vagrant dependencies..."

sudo apt update
sudo apt install -y \
    qemu-kvm libvirt-daemon-system libvirt-clients \
    bridge-utils virt-manager vagrant \
    libvirt-dev ruby-dev build-essential \
    nfs-kernel-server nfs-common

echo "[+] Adding user to libvirt group..."
sudo usermod -aG libvirt $USER

echo "[+] Enabling libvirt..."
sudo systemctl enable --now libvirtd

echo "[+] Installing vagrant-libvirt plugin..."
sg libvirt -c "vagrant plugin install vagrant-libvirt"

echo "[+] Configuring UFW for NFS (libvirt network)..."
sudo ufw allow from 192.168.121.0/24
sudo ufw --force enable
echo "[+] UFW setup complete."

echo "[+] Ensuring NFS services are running..."
sudo systemctl enable --now nfs-server
sudo systemctl enable --now rpcbind

echo "--------------------------------------------------"
echo "Done! IMPORTANT:"
echo "   Please log out and log back in (or reboot)"
echo "   so that libvirt group changes take effect."
echo "--------------------------------------------------"

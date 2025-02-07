#!/bin/sh

echo "Let's fix your problem!"

echo "--- Downloading ca-certificates"

curl -L -o ca-certificates.pkg.tar.zst "https://archlinux.org/packages/core/any/ca-certificates/download"
curl -L -o ca-certificates-utils.pkg.tar.zst "https://archlinux.org/packages/core/any/ca-certificates-utils/download"
curl -L -o ca-certificates-mozilla.pkg.tar.zst "https://archlinux.org/packages/core/any/ca-certificates-mozilla/download"

echo "--- Installing ca-certificates"

sudo pacman -U --noconfirm ca-certificates.pkg.tar.zst
sudo pacman -U --noconfirm ca-certificates-utils.pkg.tar.zst
sudo pacman -U --noconfirm ca-certificates-mozilla.pkg.tar.zst

echo "--- Updating"

sudo update-ca-trust

sudo pacman-key --init
sudo pacman-key --populate archliunx
sudo pacman-key --refresh-keys

sudo pacman -Syyu

echo "--- Next time, don't be so stupid and delete your certificates. "

#!/usr/bin/env bash
set -euo pipefail

echo "[dotfiles] Installing: stow, firefox, git, ripgrep, fd, github-cli, hyprdynamicmonitors-bin (AUR)"

have() { command -v "$1" >/dev/null 2>&1; }

REPO_PKGS=(stow firefox git ripgrep fd github-cli)
AUR_PKG=hyprdynamicmonitors-bin

if have pacman; then
  echo "Using pacman for repo packages..."
  sudo pacman -S --needed "${REPO_PKGS[@]}"

  if have yay; then
    echo "Using yay for AUR packages..."
    yay -S --needed "$AUR_PKG"
  else
    echo
    echo "NOTE: '$AUR_PKG' is an AUR package."
    echo "Install it with yay or follow upstream instructions:"
    echo "  yay -S $AUR_PKG"
    echo "Upstream: https://github.com/fiffeek/hyprdynamicmonitors"
  fi
elif have yay; then
  echo "pacman not found; using yay for all packages..."
  yay -S --needed "${REPO_PKGS[@]}" "$AUR_PKG"
else
  echo "Neither pacman nor yay found. This helper targets Arch-based systems." >&2
  exit 1
fi

echo "[dotfiles] Done."

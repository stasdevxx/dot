# dot

Personal dotfiles managed with GNU Stow. Packages under `config/` are symlinked into `~/.config`.

Included packages
- `config/nvim` — Neovim (LazyVim)
- `config/hypr` — Hyprland

## Requirements
- git
- GNU Stow
- Neovim ≥ 0.10 (for the nvim setup)
- Optional: ripgrep, fd, Nerd Font

## Install with GNU Stow (recommended)
```bash
git clone https://github.com/stasdevxx/dot ~/.dotfiles
cd ~/.dotfiles
# Stow everything under ./config into ~/.config
stow -t ~/.config config

# Open Neovim (first run installs plugins)
nvim
```

This creates symlinks such as `~/.config/nvim` and `~/.config/hypr` pointing back into this repository.

## Manage links
- Restow after updates: `stow -R -t ~/.config config`
- Unstow/remove links: `stow -D -t ~/.config config`
- Only Neovim: `stow -t ~/.config config/nvim`
- Only Hyprland: `stow -t ~/.config config/hypr`
- Adopt existing files: `stow --adopt -t ~/.config config` (review changes first)

Notes
- Run the commands from the repo root (where the `config/` directory lives).
- On macOS or other systems, `~/.config` is still a common target.

## Install dependencies (Arch)
- One-liner (pacman → yay):
  ```bash
  cd ~/.dotfiles && bash install.sh
  ```
- Installs: `stow`, `firefox`, and `hyprdynamicmonitors` (AUR).
- Uses `pacman` for repo packages; uses `yay` for AUR if present, otherwise prints instructions.

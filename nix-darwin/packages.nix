{ pkgs, ... }:
with pkgs;
[
  # Editors
  jetbrains-mono
  vim
  neovim
  alacritty
  tmux

  # Utilities
  bat
  btop
  eza
  fd
  fish
  fzf
  htop
  httpie
  jq
  ripgrep
  starship
  stow
  xz
  zip

  # Version Control
  git

  # Development Tools
  awscli
  colima
  qemu
  terraform

  # Programming Languages & Tools
  pkgs.nixfmt-rfc-style
  cargo
  zig
  go
  gofumpt
  pkgs.stylua

  # Others
  scrcpy
  pfetch
]

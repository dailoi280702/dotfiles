{ pkgs, ... }:
with pkgs;
[
  # Editors
  neovim
  vim
  alacritty
  tmux

  # Fonts
  jetbrains-mono
  iosevka

  # Utilities
  bat
  btop
  eza
  fd
  fish
  fzf
  htop
  httpie
  xh
  jq
  ripgrep
  starship
  stow
  xz
  zip
  zoxide
  tre-command
  yazi
  jnv

  # Networking
  nmap

  # Version Control
  git
  jujutsu
  gh

  # Containerization/Virtualization
  podman
  podman-compose
  colima

  # Development Tools
  awscli
  qemu
  llvm
  lld
  terraform
  valkey

  # Programming Languages & Tools
  nixfmt-rfc-style
  cargo
  rustfmt
  go
  gofumpt
  lua
  luajit
  stylua
  protobuf
  nodejs
  python3
  black
  bison
  codespell
  cmake

  # Others
  scrcpy
  fastfetch
]

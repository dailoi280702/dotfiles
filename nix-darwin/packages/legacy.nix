{ pkgs, ... }:
with pkgs;
[
  # Editors
  vim
  neovim
  alacritty
  tmux

  # Fonts
  jetbrains-mono
  nerd-fonts.zed-mono

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
  zoxide
  tre-command
  yazi

  # Networking
  nmap

  # Version Control
  git

  # Development Tools
  awscli
  colima
  qemu
  llvm
  lld
  terraform
  valkey

  # Programming Languages & Tools
  nixfmt-rfc-style
  cargo
  rustfmt
  zig
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
  warp-terminal

  # Others
  scrcpy
  pfetch
]

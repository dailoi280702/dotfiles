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
  thefuck
  zoxide
  tre-command

  # Version Control
  git

  # Development Tools
  awscli
  colima
  qemu
  terraform

  # Programming Languages & Tools
  nixfmt-rfc-style
  cargo
  zig
  go
  gofumpt
  stylua
  protobuf

  # Others
  scrcpy
  pfetch
]

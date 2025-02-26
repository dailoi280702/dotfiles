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
  thefuck
  zoxide
  tre-command

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

  # Programming Languages & Tools
  nixfmt-rfc-style
  cargo
  zig
  go
  gofumpt
  stylua
  protobuf
  nodejs

  # Others
  scrcpy
  pfetch
]

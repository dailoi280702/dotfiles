{
  description = "Lloyd nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      mac-app-util,
      nix-homebrew,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            # Editors
            pkgs.jetbrains-mono
            pkgs.vim
            pkgs.neovim
            pkgs.alacritty
            pkgs.tmux

            # Utilities
            pkgs.bat
            pkgs.btop
            pkgs.eza
            pkgs.fd
            pkgs.fish
            pkgs.fzf
            pkgs.htop
            pkgs.httpie
            pkgs.jq
            pkgs.ripgrep
            pkgs.starship
            pkgs.stow
            pkgs.xz
            pkgs.zip

            # Version Control
            pkgs.git

            # Development Tools
            pkgs.awscli
            pkgs.colima
            pkgs.qemu
            pkgs.terraform

            # Programming Languages & Tools
            pkgs.nixfmt-rfc-style
            pkgs.cargo
            pkgs.zig
            pkgs.go
            pkgs.gofumpt
            pkgs.stylua

            # Others
            pkgs.scrcpy
          ];

          nixpkgs.config = {
            allowBroken = true;
            allowUnfree = true;
          };

          homebrew = {
            enable = true;
            brews = [
              "minikube"
              "kubectl"
            ];
            casks = [ "ghostty" ];
          };

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = true;
          programs.zsh.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "x86_64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Lloyds-MacBook-Pro
      darwinConfigurations = {
        "Lloyds-MacBook-Pro" = nix-darwin.lib.darwinSystem {
          modules = [
            configuration
            mac-app-util.darwinModules.default
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                user = "Lloyd";
                autoMigrate = true;
              };
            }
          ];
        };
      };
    };
}

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
          environment.systemPackages = import ./packages/legacy.nix { inherit pkgs; };

          nixpkgs.config = {
            allowBroken = true;
            allowUnfree = true;
          };

          homebrew = {
            enable = true;
            global.autoUpdate = true;
            brews = import ./packages/brew-formulae.nix;
            casks = import ./packages/brew-cask.nix;
            taps = import ./packages/brew-tap.nix;
          };

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          programs.fish.enable = true;
          programs.zsh.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # Ssystem settings
          system.defaults.NSGlobalDomain.NSWindowShouldDragOnGesture = true;
          system.defaults.dock.autohide = true;
          system.defaults.NSGlobalDomain._HIHideMenuBar = true;
        };

      darwinSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Lloyds-MacBook-Pro
      darwinConfigurations = nixpkgs.lib.genAttrs darwinSystems (
        system:
        nix-darwin.lib.darwinSystem {
          modules = [
            configuration
            {
              nixpkgs.hostPlatform = system;
            }
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
        }
      );
    };
}

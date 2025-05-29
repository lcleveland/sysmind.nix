{ config, lib, pkgs, ... }:
let
  nix = config.system.nix;
in
{
  options.system.nix = {
    allow_unfree_software = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Allow the use of unfree software.
      '';
    };
    flake.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Whether to enable the Nix flake feature.
      '';
    };
    host_platform = lib.mkOption {
      type = lib.types.enum [ "x86_64-linux" ];
      default = "x86_64-linux";
      description = ''
        The host platform.
      '';
    };
    state_version = lib.mkOption {
      type = lib.types.str;
      default = "25.05";
      description = ''
        The state version.
      '';
    };
    store_optimization = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Whether to enable store optimization.
      '';
    };
    garbage_collection = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
          Whether to enable garbage collection.
        '';
      };
      automatic = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
          Whether to enable automatic garbage collection.
        '';
      };
      dates = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ "daily" "weekly" "monthly" ];
        description = ''
          The dates to garbage collect.
        '';
      };
      options = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ "delete-older-than" "30d" ];
        description = ''
          The options to pass to nix-store --optimize.
        '';
      };
    };
  };

  config = {
    nix = {
      settings = {
        auto-optimise-store = config.system.nix.store_optimization;
        experimental-features = lib.mkIf nix.flake.enable [ "nix-command" "flakes" ];
      };
      gc = lib.mkIf nix.garbage_collection.enable {
        automatic = nix.garbage_collection.automatic;
        dates = nix.garbage_collection.dates;
        options = nix.garbage_collection.options;
      };
    };
    nixpkgs = {
      hostPlatform = nix.host_platform;
      config.allowUnfree = nix.allow_unfree_software;
    };
    system.stateVersion = nix.state_version;
  };
}

{ config, lib, pkgs, ... }:
{
  config = {
    nix.settings.auto-optimise-store = config.system.nix.store_optimization;
    nixpkgs = {
      hostPlatform = config.system.nix.host_platform;
      config.allowUnfree = config.system.nix.allow_unfree_software;
    };
    system.stateVersion = config.system.nix.state_version;
  };
}

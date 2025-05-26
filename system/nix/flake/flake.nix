{ config, lib, pkgs, ... }:
let
  flake = config.system.nix.flake;
in
{
  config = lib.mkIf flake.enable {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };
}

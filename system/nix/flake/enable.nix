{ lib, ... }:
{
  options.system.nix.flake.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable the Nix flake feature.
    '';
  };
}

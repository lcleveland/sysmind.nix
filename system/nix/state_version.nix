{ lib, ... }:
{
  options.system.nix.state_version = lib.mkOption {
    type = lib.types.str;
    default = "25.05";
    description = ''
      The NixOS release version.
    '';
  };
}

{ lib, ... }:
{
  options.system.nix.allow_unfree_software = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Allow the use of unfree software.
    '';
  };
}

{ lib, ... }:
{
  options.system.nix.store_optimization = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Enable store optimization.
    '';
  };
}

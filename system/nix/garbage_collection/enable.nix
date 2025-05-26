{ lib, ... }:
{
  options.system.nix.garbage_collection.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable the garbage collection feature.
    '';
  };
}

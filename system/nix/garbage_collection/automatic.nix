{ lib, ... }:
{
  options.system.nix.garbage_collection.automatic = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable automatic garbage collection.
    '';
  };
}

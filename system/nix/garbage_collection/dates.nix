{ lib, ... }:
{
  options.system.nix.garbage_collection.dates = lib.mkOption {
    type = lib.types.str;
    default = "weekly";
    description = ''
      The garbage collection dates.
    '';
  };
}

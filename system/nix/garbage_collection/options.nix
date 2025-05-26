{ lib, ... }:
{
  options.system.nix.garbage_collection.options = lib.mkOption {
    type = lib.types.str;
    default = "--delete-older-than 30d";
    description = ''
      The garbage collection options.
    '';
  };
}

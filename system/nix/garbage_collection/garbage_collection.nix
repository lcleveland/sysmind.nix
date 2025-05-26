{ config, lib, pkgs, ... }:
let
  garbage_collection = config.system.nix.garbage_collection;
in
{
  config = lib.mkIf garbage_collection.enable {
    nix.gc = {
      automatic = garbage_collection.automatic;
      dates = garbage_collection.dates;
      options = garbage_collection.options;
    };
  };
}

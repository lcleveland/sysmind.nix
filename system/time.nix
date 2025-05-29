{ config, lib, pkgs, ... }:
let
  time = config.system.time;
in
{
  options.system.time = {
    time_zone = lib.mkOption {
      type = lib.types.str;
      default = "America/Chicago";
      description = ''
          The time zone.
        '';
    };
  };

  config = {
    time.timeZone = time.time_zone;
  };
}

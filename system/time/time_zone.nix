{ lib, ... }:
{
  options.system.time.time_zone = lib.mkOption {
    type = lib.types.str;
    default = "America/Chicago";
    description = ''
      The time zone.
    '';
  };
}


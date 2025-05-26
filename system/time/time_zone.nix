{ lib, ... }:
{
  options.system.time.time_zone = lib.mkOption {
    type = lib.types.str;
    default = "America/New_York";
    description = ''
      The time zone.
    '';
  };
}

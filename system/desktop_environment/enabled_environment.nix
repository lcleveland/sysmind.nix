{ config, lib, ... }:
{
  options.system.desktop_environment.enabled_environment = lib.mkOption {
    type = lib.types.enum [ "kde" "niri" ];
    default = "niri";
    description = ''
      The desktop environment to enable.
    '';
  };
}

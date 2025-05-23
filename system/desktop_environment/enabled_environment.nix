{ config, lib, ... }:
{
  options.system.desktop_environment.enabled_environment = lib.mkOption {
    type = lib.types.enum [ "kde" ];
    default = "kde";
    description = ''
      The desktop environment to enable.
    '';
  };
}

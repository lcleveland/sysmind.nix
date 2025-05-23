{ lib, ... }:
{
  options.system.desktop_environment.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable a desktop environment.
    '';
  };
}

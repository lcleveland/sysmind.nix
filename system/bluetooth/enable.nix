{ lib, ... }:
{
  options.system.bluetooth.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable bluetooth.
    '';
  };
}

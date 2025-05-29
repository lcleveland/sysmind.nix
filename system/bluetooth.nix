{ config, lib, pkgs, ... }:
let
  bluetooth = config.system.bluetooth;
in
{
  options.system.bluetooth = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Whether to enable bluetooth.
      '';
    };
  };

  config = lib.mkIf bluetooth.enable {
    hardware.bluetooth.enable = true;
  };
}

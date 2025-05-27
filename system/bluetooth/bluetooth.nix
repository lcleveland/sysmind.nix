{ config, lib, ... }:
{
  config = lib.mkIf config.system.bluetooth.enable {
    hardware.bluetooth.enable = true;
  };
}

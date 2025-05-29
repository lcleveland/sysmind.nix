{ config, lib, pkgs, ... }:
let
  bluetooth = config.system.bluetooth;
in
{
  options.system.bluetooth = {
    enable = lib.mkEnableOption "bluetooth";
  };

  config = lib.mkIf bluetooth.enable {
    hardware.bluetooth.enable = true;
  };
}

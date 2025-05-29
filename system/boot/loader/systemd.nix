{ config, lib, ... }:
let
  loader = config.system.boot.loader;
in
{
  options.system.boot.loader.systemd = {
    enable = lib.mkEnableOption "systemd";
  };

  config = lib.mkIf loader.systemd.enable {
    boot.loader.systemd-boot.enable = true;
  };
}

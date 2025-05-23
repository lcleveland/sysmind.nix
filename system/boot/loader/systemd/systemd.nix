{ config, lib, ... }:
{
  config = lib.mkIf config.system.boot.loader.systemd.enable {
    boot.loader.systemd-boot.enable = true;
  };
}

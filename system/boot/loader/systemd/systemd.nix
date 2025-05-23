{ config, lib, ... }:
{
  config = lib.mkIf config.boot.loader.systemd.enable {
    boot.loader.systemd-boot.enable = true;
  };
}

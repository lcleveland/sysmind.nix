{ config, lib, ... }:
let
  loader = config.system.boot.loader;
in
{
  options.system.boot.loader.systemd = {
    enable = lib.mkoption {
      type = lib.types.bool;
      default = true;
      description = ''
        Whether to enable systemd-boot.
      '';
    };
  };

  config = lib.mkIf loader.systemd.enable {
    boot.loader.systemd-boot.enable = true;
  };
}

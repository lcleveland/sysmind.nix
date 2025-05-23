{ lib, ... }:
{
  options.boot.loader.systemd.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable systemd.
    '';
  };
}

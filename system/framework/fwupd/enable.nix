{ lib, ... }:
{
  options.system.framework.fwupd.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable fwupd.
    '';
  };
}

{ lib, ... }:
{
  options.system.application.qemu.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable QEMU.
    '';
  };
}

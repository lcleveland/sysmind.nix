{ lib, ... }:
{
  options.system.application.libvirt.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable libvirt.
    '';
  };
}

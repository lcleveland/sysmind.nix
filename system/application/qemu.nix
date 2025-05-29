{ config, lib, pkgs, ... }:
let
  application = config.system.application;
in
{
  options.system.application.qemu = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Whether to enable qemu.
      '';
    };
  };

  config = lib.mkIf application.qemu.enable {
    environment.systemPackages = [
      pkgs.qemu
      (pkgs.writeShellScriptBin "qemu-system-x86_64-uefi" ''
          qemu-system-x86_64 \
            -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
            "$@"
        '')
    ];
  };
}

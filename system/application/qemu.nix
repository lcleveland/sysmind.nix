{ config, lib, pkgs, ... }:
let
  application = config.system.application;
in
{
  options.system.application.qemu = {
    enable = lib.mkEnableOption "qemu";
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

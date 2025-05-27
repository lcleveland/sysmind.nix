{ config, lib, ... }:
{
  config = lib.mkIf config.system.application.qemu.enable {
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

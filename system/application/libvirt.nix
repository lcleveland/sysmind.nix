{ config, lib, pkgs, ... }:
let
  application = config.system.application;
in
{
  options.system.application.libvirt = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Whether to enable libvirt.
      '';
    };
  };

  config = lib.mkIf application.libvirt.enable {
    boot.extraModprobeConfig = "options kvm_intel nested=1";
    programs.virt-manager.enable = true;
    environment.systemPackages = with pkgs; [
      (virt-manager.overrideAttrs (old: {
        nativeBuildInputs = old.nativeBuildInputs ++ [ wrapGAppsHook ];
        buildInputs = lib.lists.subtractLists [ wrapGAppsHook ] old.buildInputs ++ [
          gst_all_1.gst-plugins-base
          gst_all_1.gst-plugins-good
        ];
      }))
    ];
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };
  };
}

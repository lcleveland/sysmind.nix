{ config, lib, pkgs, ... }:
let
  cpu = config.system.cpu;
in
{
  options.system.cpu = {
    vendor = lib.mkOption {
      type = lib.types.enum [ "amd" "intel" ];
      default = "amd";
      description = ''
        The CPU vendor.
      '';
    };
    microcode = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
          Whether to enable microcode.
        '';
      };
    };
  };

  config = lib.mkIf cpu.microcode.enable {
    hardware.cpu.${cpu.vendor}.updateMicrocode = true;
  };
}

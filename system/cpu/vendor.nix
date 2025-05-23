{ lib, ... }:
{
  options.system.cpu.vendor = lib.mkOption {
    type = lib.types.enum [ "intel" "amd" ];
    default = "amd";
    description = ''
      The CPU vendor.
    '';
  };
}

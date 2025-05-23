{ config, lib, ... }:
{
  config = lib.mkIf config.system.cpu.microcode.enable {
    hardware.cpu.${config.system.cpu.vendor}.updateMicrocode = true;
  };
}

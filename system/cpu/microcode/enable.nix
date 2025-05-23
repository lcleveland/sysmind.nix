{ lib, ... }:
{
  options.system.cpu.microcode.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable microcode.
    '';
  };
}

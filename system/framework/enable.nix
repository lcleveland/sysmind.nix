{ lib, ... }:
{
  options.system.framework.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable Framework enhancements.
    '';
  };
}

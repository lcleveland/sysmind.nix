{ lib, ... }:
{
  options.system.fingerprint.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable fingerprint authentication.
    '';
  };
}

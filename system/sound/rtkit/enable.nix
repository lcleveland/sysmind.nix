{ lib, ... }:
{
  options.system.sound.rtkit.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Enable the rtkit sound server.
    '';
  };
}

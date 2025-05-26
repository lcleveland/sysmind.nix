{ lib, ... }:
{
  options.system.sound.pipewire.alsa.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Enable the ALSA sound server.
    '';
  };
}

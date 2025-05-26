{ lib, ... }:
{
  options.system.sound.pipewire.pulse_audio.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Enable the pulse audio sound server.
    '';
  };
}

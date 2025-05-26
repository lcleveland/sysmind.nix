{ lib, ... }:
{
  options.system.sound.pipewire.jack.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Enable the JACK sound server.
    '';
  };
}

{ lib, ... }:
{
  options.system.sound.pipewire.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable pipewire.
    '';
  };
}


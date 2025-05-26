{ lib, ... }:
{
  options.system.sound.pipewire.bluetooth.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Enable the Bluetooth sound server.
    '';
  };
}

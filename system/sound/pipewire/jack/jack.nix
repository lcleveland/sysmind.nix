{ config, lib, pkgs, ... }:
let
  jack = config.system.sound.pipewire.jack;
  pipewire = config.system.sound.pipewire;
in
{
  config = lib.mkIf (jack.enable && pipewire.enable) {
    services.pipewire.jack.enable = true;
  };
}

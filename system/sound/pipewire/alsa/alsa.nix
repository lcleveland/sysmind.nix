{ config, lib, pkgs, ... }:
let
  alsa = config.system.sound.pipewire.alsa;
  pipewire = config.system.sound.pipewire;
in
{
  config = lib.mkIf (alsa.enable && pipewire.enable) {
    services.pipewire.alsa.enable = true;
  };
}

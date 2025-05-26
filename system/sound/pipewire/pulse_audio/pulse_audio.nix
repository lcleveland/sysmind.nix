{ config, lib, pkgs, ... }:
let
  pulse_audio = config.system.sound.pipewire.pulse_audio;
  pipewire = config.system.sound.pipewire;
in
{
  config = lib.mkIf (pulse_audio.enable && pipewire.enable) {
    services.pipewire.pulse.enable = true;
  };
}

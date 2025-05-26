{ config, lib, pkgs, ... }:
let
  rtkit = config.system.sound.rtkit;
  pipewire = config.system.sound.pipewire;
in
{
  config = lib.mkIf (rtkit.enable && pipewire.enable) {
    security.rtkit.enable = true;
  };
}

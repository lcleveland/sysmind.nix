{ config, lib, pkgs, ... }:
let
  desktop_environment = config.system.desktop_environment;
in
{
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "niri") {
    environment.systemPackages = [
      pkgs.elegant-sddm
    ];
    programs.niri.enable = true;
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "Elegant";
    };
  };
}

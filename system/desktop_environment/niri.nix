{ config, lib, pkgs, ... }:
let
  desktop_environment = config.system.desktop_environment;
in
{
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "niri") {
    environment.systemPackages = [
      pkgs.catppuccin-sddm
      pkgs.font-awesome
    ];
    programs = {
      niri.enable = true;
      waybar.enable = true;
    };
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };
  };
}

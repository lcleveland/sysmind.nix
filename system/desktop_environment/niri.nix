{ config, lib, pkgs, ... }:
let
  desktop_environment = config.system.desktop_environment;
in
{
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "niri") {
    environment.systemPackages = with pkgs;[
      catppuccin-sddm
      font-awesome
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      nerd-fonts.fira-code
      roboto-mono
      font-awesome
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

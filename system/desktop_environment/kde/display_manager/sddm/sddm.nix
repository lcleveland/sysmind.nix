{ config, lib, ... }:
let
  desktop_environment = config.system.desktop_environment;
in
{
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde" && desktop_environment.kde.display_manager.sddm.enable) {
    services.display-manager.sddm = {
      enable = true;
      wayland.enable = desktop_environment.kde.display_manager.sddm.wayland;
    };
  };
}

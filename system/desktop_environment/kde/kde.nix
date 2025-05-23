{ config, lib, ... }:
let
  desktop_environment = config.system.desktop_environment;
in
{
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "kde") {
    services.desktopManager.plasma6.enable = true;
  };
}

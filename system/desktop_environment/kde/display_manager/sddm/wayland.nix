{ lib, ... }:
{
  options.system.desktop_environment.kde.display_manager.sddm.wayland = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable wayland.
    '';
  };
}

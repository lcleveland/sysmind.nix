{ lib, ... }:
{
  options.system.desktop_environment.kde.display_manager.sddm.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable sddm.
    '';
  };
}

{ config, lib, pkgs, ... }:
let
  sound = config.system.sound;
in
{
  options.system.sound.rtkit = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
          Whether to enable rtkit.
        '';
    };
  };

  config = lib.mkIf sound.rtkit.enable {
    security.rtkit.enable = true;
  };
}

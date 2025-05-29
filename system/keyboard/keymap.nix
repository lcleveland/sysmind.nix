{ config, lib, pkgs, ... }:
let
  keyboard = config.system.keyboard;
in
{
  options.system.keyboard.keymap = {
    layout = lib.mkOption {
      type = lib.types.str;
      default = "us";
      description = ''
        The keyboard layout.
      '';
    };
    variant = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = ''
        The keyboard variant.
      '';
    };
  };

  config = {
    services.xserver.xkb = {
      layout = keyboard.keymap.layout;
      variant = keyboard.keymap.variant;
    };
  };
}

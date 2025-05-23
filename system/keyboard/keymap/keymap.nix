{ config, lib, ... }:
let
  keyboard = config.system.keyboard;
in
{
  config = {
    services.xserver.xkb = {
      layout = keyboard.keymap.layout;
      variant = keyboard.keymap.variant;
    };
  };
}

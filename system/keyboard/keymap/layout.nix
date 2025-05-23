{ lib, ... }:
{
  options.system.keyboard.keymap.layout = lib.mkOption {
    type = lib.types.str;
    default = "us";
    description = ''
      The keyboard layout.
    '';
  };
}

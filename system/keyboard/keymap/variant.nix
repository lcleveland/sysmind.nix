{ lib, ... }:
{
  options.system.keyboard.keymap.variant = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = ''
    The keyboard variant.
  '';
  };
}

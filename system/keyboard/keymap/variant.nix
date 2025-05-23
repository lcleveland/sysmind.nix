{ lib, ... }:
{
  options.system.keyboard.keymap.layout = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = ''
    The keyboard variant.
  '';
  };
}

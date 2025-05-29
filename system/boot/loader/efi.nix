{ config, lib, ... }:
let
  loader = config.system.boot.loader;
in
{
  options.system.boot.loader.efi = {
    can_touch_efi_variables = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
          Whether the EFI variables can be touched.
        '';
    };
  };

  config = lib.mkIf loader.efi.can_touch_efi_variables {
    boot.loader.efi.canTouchEfiVariables = true;
  };
}

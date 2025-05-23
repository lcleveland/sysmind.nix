{ lib, ... }:
{
  options.boot.loader.efi.can_touch_efi_variables = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether the EFI variables can be touched.
    '';
  };
}

{ config, lib, ... }:
{
  config = lib.mkIf config.boot.loader.efi.can_touch_efi_variables {
    boot.loader.efi.can_touch_efi_variables = true;
  };
}

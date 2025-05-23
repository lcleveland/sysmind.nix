{ config, lib, ... }:
{
  config = lib.mkIf config.system.boot.loader.efi.can_touch_efi_variables {
    boot.loader.efi.can_touch_efi_variables = true;
  };
}

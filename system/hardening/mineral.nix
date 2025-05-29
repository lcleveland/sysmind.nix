{ config, inputs, lib, pkgs, ... }:
{
  config = {
    inputs.nix_mineral.nix-mineral.overrides = {
      desktop = {
        home-exec.enable = true;
        var-lib-exec.enable = true;
        usbguard-disable.enable = true;
      };
      security = {
        disable-intelme-kmodules.enable = true;
      };
    };
  };
}

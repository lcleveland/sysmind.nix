{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    "${inputs.nix_mineral}/nix-mineral.nix"
  ];
  config = {
    config.nix-mineral.overrides = {
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

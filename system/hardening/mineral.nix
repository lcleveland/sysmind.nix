{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    "${inputs.nix_mineral}/nix-mineral.nix"
  ];
  config = {
    nix-mineral.enable = true;
    nm-overrides = {
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

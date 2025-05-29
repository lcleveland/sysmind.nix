{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    "${inputs.nix_mineral}/nix-mineral.nix"
    "${inputs.nix_mineral}/nm-overrides.nix"
  ];
  config = {
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

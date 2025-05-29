{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    "${inputs.nix_mineral}/nix-mineral.nix"
  ];
  config = {
    nix-mineral = {
      enable = true;
      overrides = {
        desktop = {
          home-exec = true;
          var-lib-exec = true;
          disable-usbguard = true;
        };
        security = {
          disable-intelme-kmodules = true;
        };
      };
    };
  };
}

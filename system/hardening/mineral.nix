{ config, inputs, lib, pkgs, ... }:
{
  imports = [
    "${inputs.nix_mineral}/nix-mineral.nix"
  ];
  config = {
    nix-mineral = {
      enable = true;
      overrides = {
        compatibility = {
          allow-unsigned-modules = true;
          no-lockdown = true;
        };
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

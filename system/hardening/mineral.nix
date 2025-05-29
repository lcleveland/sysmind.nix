{ config, inputs, lib, pkgs, ... }:
let
  mineral = config.nix-mineral;
in
{
  imports = [
    "${inputs.nix_mineral}/nix-mineral.nix"
  ];
  config = {
    mineral.overrides = {
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

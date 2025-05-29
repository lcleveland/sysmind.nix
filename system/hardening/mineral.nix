{ config, inputs, lib, pkgs, ... }:
let
  mineral = config.nix-mineral;
in
{
  inports = [
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

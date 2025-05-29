{ config, lib, pkgs, ... }:
let
  kernel = config.system.boot.kernel;
in
{
  options.system.boot.kernel.kernel_package = lib.mkOption {
    type = lib.types.attrs;
    default = pkgs.linuxPackages_latest;
    description = ''
      The kernel package to use.
    '';
  };

  config = {
    boot.kernelPackages = kernel.kernel_package;
  };
}

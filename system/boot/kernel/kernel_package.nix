{ lib, pkgs, ... }:
{
  options.system.boot.kernel.package = lib.mkOption {
    type = lib.types.attrs;
    default = pkgs.linuxPackages_latest;
    description = ''
      The kernel package to use.
    '';
  };
}

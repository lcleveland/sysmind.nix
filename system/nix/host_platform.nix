{ lib, ... }:
{
  options.system.nix.host_platform = lib.mkOption {
    type = lib.types.enum [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    default = "x86_64-linux";
    description = ''
      The host platform.
    '';
  };
}

{ lib, ... }: {
  options.system.network.hostname = lib.mkOption {
    type = lib.types.str;
    default = "nixos";
    description = ''
      The hostname of the system.
    '';
  };
}

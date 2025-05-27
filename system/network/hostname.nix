{ lib, ... }: {
  options.system.network.hostname = lib.mkOption {
    type = lib.types.str;
    default = "sysmind";
    description = ''
      The hostname of the system.
    '';
  };
}

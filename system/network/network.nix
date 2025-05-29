{ config, ... }:
let
  network = config.system.network;
in
{
  options.system.network = {
    hostname = lib.mkOption {
      type = lib.types.str;
      default = "sysmind";
      description = ''
        The hostname of the system.
      '';
    };
  };

  config = {
    networking.hostName = network.hostname;
  };
}

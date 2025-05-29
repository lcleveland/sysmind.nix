{ config, lib, ... }:
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
    network_manager = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
          Whether to enable network manager.
        '';
      };
    };
  };

  config = {
    networking = {
      hostName = network.hostname;
      networkmanager.enable = network.network_manager.enable;
    };
  };
}

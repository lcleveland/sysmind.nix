{ lib, ... }:

{
  options.system.network.network_manager.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = ''
      Whether to enable the network manager service.
    '';
  };
}

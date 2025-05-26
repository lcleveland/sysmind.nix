{ config, lib, ... }: {
  config = lib.mkIf (config.system.network.network_manager.enable) {
    networking.networkmanager.enable = true;
  };
}

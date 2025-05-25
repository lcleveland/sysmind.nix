{ config, lib, ... }: {
  config = lib.mkIf (config.system.networking.network_manager.enable) {
    networking.networkmanager.enable = true;
  };
}

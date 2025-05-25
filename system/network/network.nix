{ config, ... }: {
  config = {
    networking.hostName = config.system.network.hostname;
  };
}

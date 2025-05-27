{ config, lib, ... }:
{
  config = lib.mkIf config.system.fingerprint.enable {
    services.fprintd.enable = true;
    systemd.services.fprintd = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Type = "simple";
    };
  };
}

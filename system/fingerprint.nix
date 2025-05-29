{ config, lib, pkgs, ... }:
let
  fingerprint = config.system.fingerprint;
in
{
  options.system.fingerprint = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
          Whether to enable fingerprint.
        '';
    };
  };

  config = lib.mkIf fingerprint.enable {
    services.fprintd.enable = true;
    systemd.services.fprintd = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Type = "simple";
    };
  };
}

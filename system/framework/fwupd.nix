{ config, lib, ... }:
let
  framework = config.system.framework;
in
{
  options.system.framework.fwupd = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
          Whether to enable fwupd.
        '';
    };
  };

  config = lib.mkIf framework.fwupd.enable {
    services.fwupd.enable = true;
  };
}

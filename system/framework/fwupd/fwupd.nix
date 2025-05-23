{ config, lib, ... }:
let
  framework = config.system.framework;
in
{
  config = lib.mkIf (framework.fwupd.enable && framework.enable) {
    services.fwupd.enable = true;
  };
}

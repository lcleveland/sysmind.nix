{ config, lib, ... }:
{
  config = lib.mkIf config.system.framework.enable { };
}

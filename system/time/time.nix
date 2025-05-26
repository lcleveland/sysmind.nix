{ config, lib, pkgs, ... }:
{
  config = {
    time.timeZone = config.system.time.time_zone;
  };
}

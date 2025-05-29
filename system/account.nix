{ config, lib, ... }:
let
  account = config.system.account;
in
{
  options.system.account = {
    mutable_users = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Whether to allow users to be added to the system.
      '';
    };
  };

  config = {
    users.mutableUsers = account.mutable_users;
  };
}

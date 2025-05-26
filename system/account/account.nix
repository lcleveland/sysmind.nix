{ config, lib, ... }:
{
  config = {
    users.mutableUsers = config.system.account.mutable_users;
  };
}

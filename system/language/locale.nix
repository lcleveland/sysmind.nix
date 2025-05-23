{ lib, ... }:
{
  options.system.language.locale = lib.mkOption {
    type = lib.types.str;
    default = "en_US.UTF-8";
    description = ''
      The locale to use.
    '';
  };
}

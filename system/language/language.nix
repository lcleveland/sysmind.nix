{ config, lib, ... }:
let
  language = config.system.language;
in
{
  config = {
    i18n = {
      defaultLocale = language.locale;
      extraLocaleSettings = {
        LC_TIME = language.locale;
        LC_MONETARY = language.locale;
        LC_PAPER = language.locale;
        LC_NAME = language.locale;
        LC_ADDRESS = language.locale;
        LC_TELEPHONE = language.locale;
        LC_NUMERIC = language.locale;
        LC_MEASUREMENT = language.locale;
        LC_IDENTIFICATION = language.locale;
      };
    };
  };
}

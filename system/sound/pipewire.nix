{ config, lib, pkgs, ... }:
let
  sound = config.system.sound;
in
{
  options.system.sound.pipewire = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
          Whether to enable pipewire.
        '';
    };
    alsa = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
            Whether to enable pipewire alsa.
          '';
      };
    };
    bluetooth = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
            Whether to enable pipewire bluetooth.
          '';
      };
    };
    jack = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
            Whether to enable pipewire jack.
          '';
      };
    };
    pulse_audio = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
            Whether to enable pipewire pulse audio.
          '';
      };
    };
  };

  config = lib.mkIf sound.pipewire.enable {
    services.pipewire = {
      alsa.enable = sound.pipewire.alsa.enable;
      jack.enable = sound.pipewire.jack.enable;
      pulse.enable = sound.pipewire.pulse_audio.enable;
      wireplumber.extraConfig.bluetoothEnhancements = lib.mkIf sound.pipewire.bluetooth.enable {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
        };
      };
    };
  };
}

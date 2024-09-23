{
  options,
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.desktop.hyprland;

  pamixer = lib.getExe pkgs.pamixer;

  volumectl = pkgs.writeShellScriptBin "volumectl" ''
    case "$1" in
      up)
        ${pamixer} -i "$2"
        ;;
      down)
        ${pamixer} -d "$2"
        ;;
      mute)
        ${pamixer} -t
        ;;
    esac
  '';
in
{
  options.${namespace}.desktop.hyprland = {
    enable = mkBoolOpt false "Whether or not to enable the Hyprland tiling compositor.";

    package = mkOption {
      type = types.package;
      default = pkgs.hyprland;
      description = "The Hyprland package to use.";
    };

    wallpaper = mkOption {
      type = types.oneOf [
        types.package
        types.path
        types.str
      ];
      default = pkgs.plusultra.wallpapers.nord-rainbow-dark-nix;
      description = "The wallpaper to use.";
    };

    settings = mkOption {
      type = types.attrs;
      default = { };
      description = "Extra Hyprland settings to apply.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      libinput
      volumectl
      playerctl
      brightnessctl
      glib
      gtk3.out
      gnome.gnome-control-center
      ags
      libdbusmenu-gtk3
    ];

    environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

    security.pam.services.hyprlock = { };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${lib.getExe pkgs.greetd.tuigreet} --cmd Hyprland";
        };
      };
    };

    services.upower = enabled;

    programs.dconf = enabled;
  };
}

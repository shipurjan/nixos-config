{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      # See https://wiki.hyprland.org/Configuring/Keywords/
      "$mainMod" = "SUPER";
      "$terminal" = "foot";
      "$menu" = "pkill wofi || wofi --show drun";

      # Autostart necessary processes (like notifications daemons, status bars, etc.)
      exec-once = [
        "hyprlock -q --immediate --immediate-render"
        "waybar"
        "hyprpaper"
        "mako"
        "hyprctl dispatch workspace 1"
        "[workspace special:drawer silent] $terminal -o colors.alpha=0.5"
      ];

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "DP-2, 1920x1080@240, 0x0, 1"
        "HDMI-A-2, 1920x1080, 0x-1080, 1"
        "HDMI-A-1, 3840x2160, 1920x-1280, 1.5, transform, 3"
      ];

      # See https://wiki.hyprland.org/Configuring/Environment-variables/
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      # Refer to https://wiki.hyprland.org/Configuring/Variables/
      cursor = {
        no_hardware_cursors = false;
      };

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        kb_layout = "pl";
        kb_options = "caps:escape";
        repeat_rate = 30;
        repeat_delay = 300;

        numlock_by_default = true;

        follow_mouse = 1;

        scroll_method = "on_button_down";
        scroll_button = 274;

        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };

      };

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 2;
        gaps_out = 0;
        border_size = 2;
        resize_corner = 3;
        "col.active_border" = "rgba(fc81b9ee) rgba(8c49fcee) 0deg";
        "col.inactive_border" = "rgba(595959aa)";

        allow_tearing = false;
        resize_on_border = true;

        layout = "master";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 0;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };

      };

      # See https://wiki.hyprland.org/Configuring/Animations/ for more
      animations = {
        enabled = true;

        bezier = [
          "linear, 0, 0, 1, 1"
          "easeOutExpoBack, 0.16, 1.1, 0.3, 1"
        ];
        #    bezier = "easeInSine, 0.12, 0, 0.39, 0";
        #    bezier = "easeOutSine, 0.61, 1, 0.88, 1";
        #    bezier = "easeInOutSine, 0.37, 0, 0.63, 1";
        #    bezier = "easeInQuad, 0.11, 0, 0.5, 0";
        #    bezier = "easeOutQuad, 0.5, 1, 0.89, 1";
        #    bezier = "easeInOutQuad, 0.45, 0, 0.55, 1";
        #    bezier = "easeInCubic, 0.32, 0, 0.67, 0";
        #    bezier = "easeOutCubic, 0.33, 1, 0.68, 1";
        #    bezier = "easeInOutCubic, 0.65, 0, 0.35, 1";
        #    bezier = "easeInQuart, 0.5, 0, 0.75, 0";
        #    bezier = "easeOutQuart, 0.25, 1, 0.5, 1";
        #    bezier = "easeInOutQuart, 0.76, 0, 0.24, 1";
        #    bezier = "easeInQuint, 0.64, 0, 0.78, 0";
        #    bezier = "easeOutQuint, 0.22, 1, 0.36, 1";
        #    bezier = "easeInOutQuint, 0.83, 0, 0.17, 1";
        #    bezier = "easeInExpo, 0.7, 0, 0.84, 0";
        #    bezier = "easeOutExpo, 0.16, 1, 0.3, 1";
        #    bezier = "easeInOutExpo, 0.87, 0, 0.13, 1";
        #    bezier = "easeInCirc, 0.55, 0, 1, 0.45";
        #    bezier = "easeOutCirc, 0, 0.55, 0.45, 1";
        #    bezier = "easeInOutCirc, 0.85, 0, 0.15, 1";
        #    bezier = "easeInBack, 0.36, 0, 0.66, -0.56";
        #    bezier = "easeOutBack, 0.34, 1.56, 0.64, 1";
        #    bezier = "easeInOutBack, 0.68, -0.6, 0.32, 1.6";

        animation = [
          "windows, 1, 3, easeOutExpoBack"
          "layers, 1, 3, easeOutExpoBack"
          "fade, 1, 7, easeOutExpoBack"
          "border, 1, 8, easeOutExpoBack"
          "borderangle, 1, 100, linear, loop"
          "workspaces, 1, 3, easeOutExpoBack, fade"
          "specialWorkspace, 1, 3, easeOutExpoBack, fade"
        ];
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        mfact = 0.5;
        no_gaps_when_only = 1;
        new_on_top = false;
      };

      gestures = {
        workspace_swipe = true;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        middle_click_paste = false;
      };

      windowrulev2 = [ "suppressevent maximize, class:.*" ];

      workspace = [ "1,monitor:DP-2" ];

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = [
        "$mainMod, code:51, layoutmsg, orientationcycle left top"
        "$mainMod SHIFT, code:51, layoutmsg, orientationcenter"
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, KP_ENTER, exec, $terminal"
        "$mainMod SHIFT, Q, killactive,"
        "$mainMod, code:115, exit,"
        "$mainMod, SPACE, exec, $menu"
        "$mainMod, F3, togglefloating"
        ''$mainMod SHIFT, H, exec, $terminal -e sh -c "nvim ~/.nix/home/programs/hyprland.nix"''
        ''$mainMod SHIFT, P, exec, $terminal -e sh -c "nvim ~/.nix/system/nixpkgs/default.nix"''

        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%-"
        ", XF86Search, exec, $menu"
        ", XF86AudioMute, exec, amixer set Master toggle"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause # the stupid key is called play , but it toggles "
        ", XF86AudioNext, exec, playerctl next "
        ", XF86AudioPrev, exec, playerctl previous"

        ''CTRL, Print, exec, grim -g "$(slurp)" - | swappy -f - -o - | pngquant - | echo -''
        '', Print, exec, grim -g "$(slurp -d)" - | wl-copy''

        "$mainMod, code:59, focusmonitor, -1"
        "$mainMod, code:60, focusmonitor, +1"
        "$mainMod SHIFT, code:59, movewindow, mon:-1 silent"
        "$mainMod SHIFT, code:60, movewindow, mon:+1 silent"
        "$mainMod CTRL SHIFT, code:59, movewindow, mon:-1"
        "$mainMod CTRL SHIFT, code:60, movewindow, mon:+1"

        "$mainMod, 1, workspace, r~1"
        "$mainMod, 2, workspace, r~2"
        "$mainMod, 3, workspace, r~3"
        "$mainMod, 4, workspace, r~4"
        "$mainMod, 5, workspace, r~5"
        "$mainMod, 6, workspace, r~6"
        "$mainMod, 7, workspace, r~7"
        "$mainMod, 8, workspace, r~8"
        "$mainMod, 9, workspace, r~9"

        "$mainMod SHIFT, 1, movetoworkspacesilent, r~1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, r~2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, r~3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, r~4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, r~5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, r~6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, r~7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, r~8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, r~9"

        "$mainMod CTRL SHIFT, 1, movetoworkspace, r~1"
        "$mainMod CTRL SHIFT, 2, movetoworkspace, r~2"
        "$mainMod CTRL SHIFT, 3, movetoworkspace, r~3"
        "$mainMod CTRL SHIFT, 4, movetoworkspace, r~4"
        "$mainMod CTRL SHIFT, 5, movetoworkspace, r~5"
        "$mainMod CTRL SHIFT, 6, movetoworkspace, r~6"
        "$mainMod CTRL SHIFT, 7, movetoworkspace, r~7"
        "$mainMod CTRL SHIFT, 8, movetoworkspace, r~8"
        "$mainMod CTRL SHIFT, 9, movetoworkspace, r~9"

        "$mainMod, TAB, togglespecialworkspace, drawer"
        "$mainMod SHIFT, TAB, movetoworkspacesilent, special:drawer"
      ];

      binde = [
        "$mainMod, K, layoutmsg, cyclenext"
        "$mainMod, J, layoutmsg, cycleprev"
        "$mainMod SHIFT, K, layoutmsg, swapnext"
        "$mainMod SHIFT, J, layoutmsg, swapprev"
        "$mainMod SHIFT, H, layoutmsg, addmaster"
        "$mainMod SHIFT, L, layoutmsg, removemaster"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}

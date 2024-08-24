{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        ignore_empty_input = true;
        grace = 0;
        immediate_render = true;
        hide_cursor = true;
        no_fade_in = true;
        no_fade_out = false;
      };

      background = [
        {
          monitor = "HDMI-A-1";
          color = "rgb(000000)";
        }
        {
          monitor = "HDMI-A-2";
          color = "rgb(000000)";
        }
        {
          monitor = "DP-2";
          color = "rgb(000000)";
          path = builtins.toString ../../images/greek-woman-with-cat.jpg;
        }
      ];

      shape = [
        {
          size = "1920, 300";
          color = "rgba(00000077)";
          position = "0, 0";
          halign = "center";
          valign = "bottom";
        }
      ];

      input-field = [
        {
          monitor = "DP-2";
          size = "200, 50";
          outline_thickness = 3;
          # Scale of input-field height, 0.2 - 0.8
          dots_size = 0.33;
          # Scale of dots' absolute size, 0.0 - 1.0
          dots_spacing = 0.15;
          dots_center = true;
          # -1 default circle, -2 follow input-field rounding
          dots_rounding = -1;
          outer_color = "rgb(ffbe00)";
          inner_color = "rgb(FFFFFF)";
          font_color = "rgb(10, 10, 10)";
          fade_on_empty = false;
          # Text rendered in the input box when it's empty.
          placeholder_text = ''<i>Input Password...</i>'';
          hide_input = false;
          # -1 means complete rounding (circle/oval)
          rounding = -1;
          check_color = "rgb(204, 136, 34)";
          # if authentication failed, changes outer_color and fail message color
          fail_color = "rgb(204, 34, 34)";
          # can be set to empty
          fail_text = ''<i>$FAIL <b>($ATTEMPTS)</b></i>'';
          # transition time in ms between normal outer_color and fail_color
          fail_transition = 300;
          capslock_color = -1;
          numlock_color = -1;
          # when both locks are active. -1 means don't change outer color (same for above)
          bothlock_color = -1;
          # change color if numlock is off
          invert_numlock = false;
          swap_font_color = false;
          position = "0, 100";
          halign = "center";
          valign = "bottom";
          shadow_passes = 2;
          shadow_size = 10;
        }
      ];

      label = [
        {
          monitor = "DP-2";
          text = ''cmd[update:1000] echo "$TIME"'';
          color = "rgba(255, 190, 0, 1)";
          font_size = 120;
          font_family = "Fira Semibold";
          position = "0, -80";
          halign = "center";
          valign = "top";
          shadow_passes = 2;
          shadow_size = 20;
        }
        {
          monitor = "DP-2";
          text = ''$USER'';
          color = "rgba(255, 190, 0, 1)";
          font_size = 56;
          font_family = "Fira Semibold";
          position = "0, 185";
          halign = "center";
          valign = "bottom";
          shadow_passes = 2;
          shadow_size = 20;
        }
      ];
    };
  };
}

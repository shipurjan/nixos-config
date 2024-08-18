{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";

        font = "Fira Code:size=14";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "no";
      };

      colors = {
        alpha = 0.9;
        background = "000000";
        foreground = "ffffff";
        flash = "00ff00";
        flash-alpha = 0.5;
      };
    };
  };
}

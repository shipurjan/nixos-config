{ pkgs, ... }:
{
  programs.swaylock =
    let
      transparent = "#ffffff00";
    in
    {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        ignore-empty-password = true;
        disable-caps-lock-text = true;
        font = "Fira Semibold";

        clock = true;
        timestr = "%R";
        datestr = "%d/%m/%Y, %A";

        image = builtins.toString ../../../images/greek-woman-with-cat.jpg;

        indicator = true;
        indicator-radius = 400;
        indicator-thickness = 30;
        indicator-caps-lock = true;

        key-hl-color = "#122c3f";
        bs-hl-color = "#122c3f";
        caps-lock-key-hl-color = "#994400";
        caps-lock-bs-hl-color = "#994400";

        separator-color = "#122c3f";

        inside-color = transparent;
        inside-clear-color = transparent;
        inside-caps-lock-color = transparent;
        inside-ver-color = transparent;
        inside-wrong-color = transparent;

        ring-color = transparent;
        ring-clear-color = transparent;
        ring-caps-lock-color = transparent;
        ring-ver-color = transparent;
        ring-wrong-color = transparent;

        line-color = transparent;
        line-clear-color = transparent;
        line-caps-lock-color = transparent;
        line-ver-color = transparent;
        line-wrong-color = transparent;

        text-color = "#122c3f";
        text-clear-color = "#33992255";
        text-caps-lock-color = "#994400";
        text-ver-color = "#223399";
        text-wrong-color = "#990000";

        debug = true;
      };

    };
}

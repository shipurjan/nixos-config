{
  services.hyprpaper = {
    enable = true;
    settings =
      let
        wpaperPrimary = builtins.toString ../../../images/greek-woman-with-cat.jpg;
        wpaperSecondary = builtins.toString ../../../images/bitches-brew.jpg;
        wpaperVertical = builtins.toString ../../../images/forest.jpg;
      in
      {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          wpaperPrimary
          wpaperSecondary
          wpaperVertical
        ];

        wallpaper = [
          "DP-2,${wpaperPrimary}"
          "HDMI-A-2,${wpaperSecondary}"
          "HDMI-A-1,${wpaperVertical}"
        ];
      };
  };
}

{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ../../images/bitches-brew.jpg;
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.gyre-fonts;
        name = "TeX Gyre Schola";
      };

      sansSerif = {
        package = pkgs.gyre-fonts;
        name = "TeX Gyre Heros";
      };

      monospace = {
        package = pkgs.fira-code;
        name = "Fira Code";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}

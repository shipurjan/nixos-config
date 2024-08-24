{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      twemoji-color-font
      font-awesome
      fira-code
      fira-code-symbols
      powerline-fonts
      powerline-symbols
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];

    fontconfig = {
      useEmbeddedBitmaps = true;
      subpixel = {
        rgba = "none";
      };
      hinting = {
        style = "medium";
      };
      defaultFonts = {
        serif = [
          "TeX Gyre Schola"
          "Noto Sans CJK JP"
        ];
        sansSerif = [
          "TeX Gyre Heros"
          "Noto Sans CJK JP"
        ];
        monospace = [
          "Fira Code"
          "Noto Sans Mono CJK JP"
        ];
      };
    };
  };
}

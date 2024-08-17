{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./sound.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # system
    foot
    dolphin
    wofi
    htop

    # programming
    git
    gh

    # nix/nixos tools
    home-manager
    statix
    nixfmt-rfc-style

    # misc
    element-desktop-wayland
    neovim
    waybar
    hyprpaper
    gammastep
    mako

    xdg-utils
    tree
    neofetch
    firefox
    wget
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}

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
    nsxiv
    dolphin
    wofi
    htop

    # programming
    git
    gh

    # nix/nixos tools
    home-manager
    grimblast
    statix
    nixfmt-rfc-style

    # misc
    unzip
    gnumake
    element-desktop-wayland
    neovim
    waybar
    hyprpaper
    gammastep
    mako

    grim
    slurp
    swappy
    pngquant
    wl-clipboard
    playerctl

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
    fira-code
    fira-code-symbols
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}

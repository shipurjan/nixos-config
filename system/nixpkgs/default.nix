{ pkgs, inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./sound.nix
    ./greetd.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  nixpkgs.config.permittedInsecurePackages = [ "jitsi-meet-1.0.8043" ];

  environment.systemPackages = with pkgs; [
    inputs.nixvim.packages.${pkgs.system}.default

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

    # cli-utils
    silver-searcher # ag - recursive string search in directory
    tldr # better man
    scc # count code lines
    duf # disk usage - better df
    dua # disk usage - better du
    aria2 # download utility - better wget
    bat # better cat
    diff-so-fancy # better diff
    fzf # fuzzy find
    jq # json processor
    most # better more/less
    procs # better ps
    rsync # incremental file transfer
    sd # simpler sed
    gping # better ping
    speedtest-cli # internet speed test

    # TODO: configure with Wiki
    # https://nixos.wiki/wiki/Docker
    # docker
    # docker-compose
    # lazydocker

    # misc
    unzip
    gnumake
    element-desktop-wayland
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

    wev
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

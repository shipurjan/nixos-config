{ pkgs, inputs, ... }:
{
  imports = [
    ./fonts.nix
    ./nix-your-shell.nix
    ./zsh.nix
    ./hyprland.nix
    ./sound.nix
    ./greetd.nix
    ./steam.nix
    ./stylix.nix
    ./mullvad.nix
    ./nix-ld.nix
    ./gvfs.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  nixpkgs.config.permittedInsecurePackages = [ "jitsi-meet-1.0.8043" ];

  environment.systemPackages = with pkgs; [
    inputs.nixvim-config.packages.${pkgs.system}.default

    # zsh shell
    pure-prompt

    # system
    nsxiv
    pcmanfm
    wofi
    htop

    # programming
    git
    gh

    # nix/nixos tools
    cachix
    home-manager
    grimblast
    statix
    nix-index
    nix-prefetch-git
    nixfmt-rfc-style

    # cli-utils
    gping # alternative for `ping`
    procs # altrnative for `ps`
    tldr # alternative for `man`
    duf # alternative for `df`
    dua # alternative for `du`
    aria2 # alternative for `wget`
    bat # alternative for `cat`
    diff-so-fancy # alternative for `diff`
    fd # alternative for `find`
    sd # simpler alternative for `sed`

    rsync # incremental file transfer
    fzf # fuzzy find
    scc # code line counter
    silver-searcher # ag - recursive string search in directory
    jq # json processor
    speedtest-cli # internet speed test
    yt-dlp # online video downloader
    ffmpeg # video/audio media converter
    mpv
    # TODO: add mpv

    # TODO: configure with Wiki
    # https://nixos.wiki/wiki/Docker
    # docker
    # docker-compose
    # lazydocker

    # misc
    discord
    keepassxc
    vesktop
    unzip
    gnumake
    element-desktop-wayland
    waybar
    gammastep
    mako
    protonup
    mangohud

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
    google-chrome
    firefox-esr
    wget
  ];
}

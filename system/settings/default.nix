{
  imports = [
    ./nvidia.nix
    ./xdg.nix
  ];

  # Boot
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
  };

  networking.hostName = "nixos";
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users = {
    cyprian = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "input"
      ];
    };
  };

  # !!! Don't change the following line !!! #
  system.stateVersion = "24.05";
}

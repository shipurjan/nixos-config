{ pkgs, ... }:
{
  imports = [
    ./cachix.nix
    ./nvidia.nix
    ./xdg.nix
    ./pam.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Boot
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
    kernelParams = [
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
    ];
  };

  networking.hostName = "nixos";
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users = {
    defaultUserShell = pkgs.nushell;
    users = {
      cyprian = {
        shell = pkgs.nushell;
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
          "input"
        ];
      };
    };
  };

  # !!! Don't change the following line !!! #
  system.stateVersion = "24.05";
}

{ pkgs, ... }:
{
  imports = [
    ./nix.nix
    ./nvidia.nix
    ./xdg.nix
    ./pam.nix
  ];

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    shells = with pkgs; [ zsh ];
    variables = {
      EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  # Boot
  boot = {
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
    ];
  };

  networking.hostName = "nixos";
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      cyprian = {
        shell = pkgs.zsh;
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

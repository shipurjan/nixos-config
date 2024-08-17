{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
      rebuild = "sudo nixos-rebuild switch";
    };
  };
}

{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
      n = "cd ~/.nix";
      l = "ls";
      ll = "l -l";
      la = "ll -a";
      c = "clear";
      rebuild = "sudo nixos-rebuild switch --flake ~/.nix && home-manager switch --flake ~/.nix";
    };
  };
}

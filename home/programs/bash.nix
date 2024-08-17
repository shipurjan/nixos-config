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
      nr = "sudo nixos-rebuild switch --flake ~/.nix && home-manager switch --flake ~/.nix";
      nt = "sudo nixos-rebuild test --flake ~/.nix && home-manager switch --flake ~/.nix";
    };
  };
}

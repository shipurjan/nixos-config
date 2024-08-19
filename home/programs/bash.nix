{
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
      n = "cd ~/.nix";
      f = "cd ~/.flakes";
      l = "ls";
      ll = "l -l";
      la = "ll -a";
      c = "clear";
      ns = "sudo nixos-rebuild switch --flake ~/.nix";
      nt = "sudo nixos-rebuild test --flake ~/.nix";
      hs = "home-manager switch --flake ~/.nix";
      rebuild = "ns && hs";
    };
  };
}

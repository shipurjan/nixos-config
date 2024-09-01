{
  imports = [
    ./carapace.nix
    ./starship.nix
  ];

  programs.nushell = {
    enable = true;
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
    };
  };
}

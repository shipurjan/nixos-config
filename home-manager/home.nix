{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "cyprian";
    homeDirectory = "/home/cyprian";
    stateVersion = "23.11";
  };
}

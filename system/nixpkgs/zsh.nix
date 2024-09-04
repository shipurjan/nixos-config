{
  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      nix-your-shell zsh | source
    '';
  };
}

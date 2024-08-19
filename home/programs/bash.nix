{
  programs.bash =
    let
      ezaGit = "eza -x --git --color=auto -s ext --group-directories-first";
      eza = ezaGit + " --git-ignore";

      ezatreeGit = ezaGit + " -T -L 1";
      ezatree = ezatreeGit + " --git-ignore";

      ezadirsGit = ezatreeGit + " -D";
      ezadirs = ezatree + " -D";

      ezafilesGit = ezatreeGit + " -f";
      ezafiles = ezatree + " -f";
    in
    {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        # eza
        ls = eza;
        LS = ezaGit;

        l = eza;
        L = ezaGit;

        ll = eza + " -l";
        LL = ezaGit + " -l";

        la = eza + " -la";
        LA = ezaGit + " -la";

        t = ezatree;
        T = ezatreeGit;

        d = ezadirs;
        D = ezadirsGit;

        f = ezafiles;
        F = ezafilesGit;

        # directories
        # go nix
        gn = "cd ~/.nix";
        # go flakes
        gf = "cd ~/.flakes";

        # terminal
        c = "clear && " + eza;

        # nixos / home-manager
        # nixos switch
        ns = "sudo nixos-rebuild switch --flake ~/.nix";
        # nixos test
        nt = "sudo nixos-rebuild test --flake ~/.nix";
        # home-manager switch
        hs = "home-manager switch --flake ~/.nix";
        rebuild = "ns && hs";

        # nvim
        vim = "nvim";
        vi = "nvim";
      };
      initExtra = ''
        function cd {
          builtin cd "$@" && ${eza}
        }

        c'';
    };
}

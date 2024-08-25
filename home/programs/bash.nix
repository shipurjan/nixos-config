{
  programs.bash =
    let
      eza = "eza -x --git --color=auto -s ext --group-directories-first";
      ezatree = eza + " -T -L 1";
      ezadirs = ezatree + " -D";
      ezafiles = ezatree + " -f";
    in
    {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        cp = "cp -iv";
        mv = "mv -iv";
        rm = "rm -iv";

        # eza
        l = eza + " --git-ignore";
        ls = eza;
        ll = eza + " -l";
        la = eza + " -la";
        t = ezatree;
        d = ezadirs;
        f = ezafiles;

        # edit directories
        # vim nix
        vn = "cd ~/.nix && nvim .";
        # vim flakes
        vf = "cd ~/.flakes && nvim .";

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
        export PS1='\[\033[01;34m\]\w\[\033[00m\]\[\033[01;32m\]\[\033[00m\]\$ '

        function cd {
          builtin cd "$@" && ${eza}
        }

        c'';
    };
}

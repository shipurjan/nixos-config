{ config, ... }:
{
  programs.zsh =
    let
      ls = "eza -x --git --color=auto --smart-group -s ext --group-directories-first";
      tree = "${ls} -T -L 1";
      switch-home = "home-manager switch --flake ~/.nix";
      c = "clear && ${ls}";
    in
    {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        inherit
          c
          switch-home
          tree
          ls
          ;
        l = ls;
        ll = "${ls} -l";
        la = "${ls} -la";
        t = tree;
        d = "${tree} -D";
        f = "${tree} -F";

        vi = "nvim";
        vim = "nvim";

        ping = "gping -b 12";
        cat = "bat --style=plain --pager=never";
        switch = "sudo nixos-rebuild switch --flake ~/.nix && ${switch-home}";
        test = "sudo nixos-rebuild test --flake ~/.nix && ${switch-home}";
      };

      initExtra = ''
        # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/alias-finder
        zstyle ':omz:plugins:alias-finder' autoload yes
        zstyle ':omz:plugins:alias-finder' exact yes
        zstyle ':omz:plugins:alias-finder' cheaper yes
        zstyle ':omz:plugins:alias-finder' longer yes

        # https://github.com/sindresorhus/pure
        autoload -U promptinit; promptinit
        prompt pure

        function cd {
          builtin cd "$@" && ${ls};
        }

        ${c}
      '';

      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [
          "alias-finder"
          "git"
        ];
      };

    };
}

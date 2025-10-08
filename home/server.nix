{
  config,
  pkgs,
  lib,
  username,
  ...
}: let
  rWithPackages = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [
      languageserver
      lintr
      tidyverse
      httpgd
      here
      ggthemes
      cowplot
      ggsci
      Hmisc
    ];
  };
in {
  imports = [./common];

  home = {
    stateVersion = "24.05";

    username = "${username}";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      alejandra
      bear
      black
      bpftrace
      clang-tools
      codex
      dust
      eza
      fd
      glow
      koka
      maven
      neofetch
      nixfmt-classic
      nushell
      perf-tools
      pwndbg
      rWithPackages
      radare2
      reptyr
      ripgrep
      rustup
      sbt
      scalafmt
      temurin-bin-23
      tmux
      uv
      visidata
    ];

    file = {
      "${config.xdg.configHome}/oh-my-zsh" = {
        source = ../dotfiles/oh-my-zsh;
        recursive = true;
      };
      "${config.xdg.configHome}/tmux" = {
        source = ../dotfiles/tmux;
        recursive = true;
      };
    };
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = false;
    autosuggestion = {
      enable = true;
      highlight = "fg=#676e7b";
    };
    syntaxHighlighting = {
      enable = true;
      styles = {arg0 = "fg=green,bold";};
    };
    oh-my-zsh = {
      enable = true;
      custom = "${config.xdg.configHome}/oh-my-zsh";
      theme = "eugebe";
      plugins = ["colored-man-pages" "vi-mode"];
    };
    shellAliases = {
      b = "cd $OLDPWD";
      c = "clear";
      ls = "eza";
      ll = "eza -l --group";
      la = "eza -a --group";
      l = "eza -la --group";
      zshsrc = "source $HOME/.zshrc";
    };
  };

  programs.git = {
    enable = true;
    userName = "Eugene Chou";
    userEmail = "euchou@ucsc.edu";
    ignores = [
      ".direnv"
      ".DS_Store"
    ];
    aliases = {
      pushall = "!git remote | xargs -L1 git push --all";
      history = "!git log --pretty=format: --name-only --diff-filter=A | sort -u";
      adog = "log --all --decorate --oneline --graph";
      cowboy = ''!git commit -m "🤠"'';
    };
    extraConfig = {
      pull.rebase = false;
      init.defaultBranch = "main";
      merge.tool = "nvim";
      mergetool = {
        keepBackup = false;
        prompt = false;
        nvim.cmd = ''nvim -d -c "wincmd l" -c "norm ]c" "$LOCAL" "$MERGED" "$REMOTE"'';
      };
      commit = {
        verbose = true;
        gpgsign = true;
      };
      gpg.format = "ssh";
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFBLps3u2eBfFN0b0CGTDLgtLAmYGdglShNsoXxXQX1j";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}

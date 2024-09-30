{ config, pkgs, lib, username, ... }: {
  imports = [ ../modules/nvim ];

  home = {
    stateVersion = "23.05";

    username = "${username}";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      bear
      clang-tools
      dust
      eza
      fd
      neofetch
      nixfmt-classic
      radare2
      ripgrep
      rustup
      tmux
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
      styles = { arg0 = "fg=green,bold"; };
    };
    oh-my-zsh = {
      enable = true;
      custom = "${config.xdg.configHome}/oh-my-zsh";
      theme = "eugebe";
    };
    shellAliases = {
      back = "cd $OLDPWD";
      c = "clear";
      ls = "eza";
      ll = "eza -l";
      la = "eza -a";
      l = "eza -la";
      zshsrc = "source ~/.zshrc";
    };
  };

  programs.git = {
    enable = true;
    userName = "Eugene Chou";
    userEmail = "euchou@ucsc.edu";
    ignores = [ ".DS_Store" ];
    aliases = {
      pushall = "!git remote | xargs -L1 git push --all";
      history =
        "!git log --pretty=format: --name-only --diff-filter=A | sort -u";
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
        nvim.cmd =
          ''nvim -d -c "wincmd l" -c "norm ]c" "$LOCAL" "$MERGED" "$REMOTE"'';
      };
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey =
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFBLps3u2eBfFN0b0CGTDLgtLAmYGdglShNsoXxXQX1j";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--layout=reverse"
      "-m"
      "--bind ctrl-p:preview-up,ctrl-n:preview-down"
    ];
  };
}

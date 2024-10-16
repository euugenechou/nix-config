{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [./common.nix];

  home = {
    stateVersion = "24.05";

    packages = with pkgs; [
      alejandra
      bat
      bear
      cabal-install
      clang-tools
      dust
      eza
      fd
      ghc
      ghostscript
      glances
      idris2
      imagemagick
      lilypond
      neofetch
      nixfmt-classic
      radare2
      ripgrep
      rustup
      tmux
      yt-dlp
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
      "${config.xdg.configHome}/aerospace" = {
        source = ../dotfiles/aerospace;
        recursive = true;
      };
      "${config.xdg.configHome}/alacritty" = {
        source = ../dotfiles/alacritty;
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
      plugins = ["colored-man-pages"];
    };
    shellAliases = {
      b = "cd $OLDPWD";
      c = "clear";
      ls = "eza";
      ll = "eza -l";
      la = "eza -a";
      l = "eza -la";
      yt-m4a = "yt-dlp -f ba[ext=m4a]";
      zshsrc = "source ~/.zshrc";
    };
    initExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      export PATH=$PATH:/Library/Tex/texbin
      export MANPATH=$MANPATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/share/man
      export MANPATH=$MANPATH:/Library/Developer/CommandLineTools/usr/share/man
      export MANPATH=$MANPATH:/Library/Developer/CommandLineTools/Toolchains/XcodeDefault.xctoolchain/usr/share/man
      less_termcap[so]="''${fg_bold[249]}"
    '';
  };

  programs.git = {
    enable = true;
    userName = "Eugene Chou";
    userEmail = "euchou@ucsc.edu";
    ignores = [".DS_Store"];
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
      commit.gpgsign = true;
      gpg = {
        format = "ssh";
        ssh.program =
          lib.mkIf (pkgs.stdenv.isDarwin)
          "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFBLps3u2eBfFN0b0CGTDLgtLAmYGdglShNsoXxXQX1j";
    };
  };
}

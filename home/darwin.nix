{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [./common];

  home = {
    stateVersion = "24.05";

    packages = with pkgs; [
      act
      alejandra
      awscli2
      bat
      bear
      bfg-repo-cleaner
      black
      btop
      cabal-install
      clang-tools
      claude-code
      codex
      cmake
      devcontainer
      dust
      eza
      gh
      gitflow
      fd
      fontconfig
      fselect
      ghc
      ghostscript
      glances
      glow
      go
      gradle
      graphviz
      htop
      idris2
      imagemagick
      iperf
      # lilypond-unstable
      lima
      maven
      moreutils
      neofetch
      pandoc
      pkg-config
      pyright
      python311
      prettier
      qemu
      radare2
      ripgrep
      ruff
      # rustup: Verus dislikes this?
      sbt-with-scala-native
      scalafmt
      stack
      tmux
      tokei
      typst
      uv
      wget
      yt-dlp
      zig
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
      "${config.xdg.configHome}/alacritty" = {
        source = ../dotfiles/alacritty;
        recursive = true;
      };
      "${config.xdg.configHome}/ghostty" = {
        source = ../dotfiles/ghostty;
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
      ll = "eza -l --group";
      la = "eza -a --group";
      l = "eza -la --group";
      yt-m4a = "yt-dlp -f ba\[ext=m4a\]";
      zshsrc = "source ~/.zshrc";
    };
    initContent = ''
      if [[ -z "$HOMEBREW_PREFIX" ]]; then
        PRE_BREW_PATH=$PATH
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export PATH=$PRE_BREW_PATH:$PATH
      fi

      export PATH=$PATH:/Library/Tex/texbin
      export PATH=$PATH:$HOME/go/bin
      export PATH=$PATH:$HOME/.local/bin
      export PATH=$PATH:$HOME/.docker/bin

      [[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

      export MANPATH=$MANPATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/share/man
      export MANPATH=$MANPATH:/Library/Developer/CommandLineTools/usr/share/man
      export MANPATH=$MANPATH:/Library/Developer/CommandLineTools/Toolchains/XcodeDefault.xctoolchain/usr/share/man

      export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

      less_termcap[so]="''${fg_bold[249]}"
    '';
  };

  programs.git = {
    enable = true;
    ignores = [".DS_Store"];
    settings = {
      user = {
        name = "Eugene Chou";
        email = "euchou@ucsc.edu";
      };
      aliases = {
        pushall = "!git remote | xargs -L1 git push --all";
        history = "!git log --pretty=format: --name-only --diff-filter=A | sort -u";
        adog = "log --all --decorate --oneline --graph";
        cowboy = ''!git commit -m "🤠"'';
      };
      extraConfig = {
        pull.rebase = false;
        init.defaultBranch = "main";
      };
    };
    signing = {
      signByDefault = true;
      format = "ssh";
      signer = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFBLps3u2eBfFN0b0CGTDLgtLAmYGdglShNsoXxXQX1j";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}

{
  inputs,
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
      btop
      cabal-install
      clang-tools
      cmake
      dafny
      dust
      eza
      gitflow
      fd
      fontconfig
      fselect
      ghc
      ghostscript
      glances
      glow
      go
      graphviz
      idris2
      imagemagick
      iperf
      lilypond-unstable
      moreutils
      neofetch
      nixfmt-classic
      pkg-config
      python311
      pyright
      radare2
      ripgrep
      ruff
      rustup
      tmux
      typst
      uv
      wget
      yt-dlp
      zig
      inputs.pwndbg.packages.${pkgs.system}.pwndbg-lldb
      inputs.verusfmt.packages.${pkgs.system}.verusfmt
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

      export MANPATH=$MANPATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/share/man
      export MANPATH=$MANPATH:/Library/Developer/CommandLineTools/usr/share/man
      export MANPATH=$MANPATH:/Library/Developer/CommandLineTools/Toolchains/XcodeDefault.xctoolchain/usr/share/man

      export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

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

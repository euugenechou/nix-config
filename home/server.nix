{
  config,
  pkgs,
  lib,
  username,
  ...
}: {
  imports = [./common];

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  home = {
    stateVersion = "24.05";

    username = "${username}";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      alejandra
      bfg-repo-cleaner
      bear
      black
      bpftrace
      clang-tools
      codex
      dust
      eza
      fastfetch
      fd
      gh
      glow
      koka
      maven
      nushell
      perf-tools
      pwndbg
      rForResearch
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
      "${config.xdg.configHome}/git/allowed_signers".text = ''
        euchou@ucsc.edu ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFBLps3u2eBfFN0b0CGTDLgtLAmYGdglShNsoXxXQX1j
      '';
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
    ignores = [
      ".direnv"
      ".DS_Store"
    ];
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
        when-removed = ''
          !f() {
            if [ -z "$1" ]; then
              echo "Usage: git when-removed <path>";
              exit 1;
            fi;
            git log --diff-filter=D --summary \
              --format="%C(yellow)%h%Creset %Cgreen%ad%Creset %C(cyan)%an%Creset %s" \
              --date=short -- "$1" |
              grep -E "delete mode|^[0-9a-f]{7,}" --color=never;
          }; f
        '';
        revive = ''
          !f() {
            path="$1";
            if [ -z "$path" ]; then
              echo "Usage: git revive <path>";
              exit 1;
            fi;
            echo "🔍 Searching for last version of $path...";
            commit=$(git rev-list -n 1 HEAD -- "$path");
            if [ -z "$commit" ]; then
              echo "❌ No previous version of $path found in history.";
              exit 1;
            fi;
            echo "🔄 Restoring from commit $commit...";
            git checkout "$commit" -- "$path" &&
            echo "✅ Revived $path from $commit";
          }; f
        '';
      };
      pull.rebase = false;
      init.defaultBranch = "main";
      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";
    };
    signing = {
      signByDefault = true;
      format = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFBLps3u2eBfFN0b0CGTDLgtLAmYGdglShNsoXxXQX1j";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}

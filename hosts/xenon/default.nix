{pkgs, ...}: {
  imports = [../../home/server.nix];

  programs.zsh.initContent = ''
    less_termcap[so]="''${fg_bold[249]}"

    export OBLIVIATE_DISK="/dev/nvme14n1";
    export OBLIVIATE_PARTITION_SIZE="128";
    export OBLIVIATE_ROOT="/obliviate";

    export PATH=$PATH:$HOME/.bpftime

    export JAVA_HOME="${pkgs.temurin-bin-23}";

    # Restore ^F for autosuggestion acceptance in vi insert mode
    bindkey -M viins '^F' forward-char
  '';
}

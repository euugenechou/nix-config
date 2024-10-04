{
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

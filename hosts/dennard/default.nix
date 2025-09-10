{...}: {
  imports = [../../home/server.nix];

  programs.zsh.initContent = ''
    less_termcap[so]="''${fg_bold[249]}"
  '';
}

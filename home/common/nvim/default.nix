{
  programs.nixvim = {
    enable = true;
    enableMan = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    colorschemes = import ./colorschemes.nix;
    globals = import ./globals.nix;
    opts = import ./opts.nix;
    keymaps = import ./keymaps.nix;
    plugins = import ./plugins;
    autoCmd = import ./autocmd.nix;
  };
}

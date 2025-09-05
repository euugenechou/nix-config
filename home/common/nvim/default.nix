{
  inputs,
  pkgs,
  ...
}: let
  aerial = pkgs.vimUtils.buildVimPlugin {
    name = "aerial";
    src = pkgs.fetchFromGitHub {
      owner = "stevearc";
      repo = "aerial.nvim";
      rev = "140f48fb068d21c02e753c63f7443649e55576f0";
      hash = "sha256-7Sj7Z5blJ6Qk/99EV4EBv4vdK1dHDGFL3WRYLEnrRC0=";
    };
  };
in {
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
    extraPlugins = [aerial];
    extraConfigLua = ''
      require('aerial').setup({})
    '';
  };
}

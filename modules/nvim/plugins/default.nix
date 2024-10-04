{
  cmp = import ./cmp.nix;
  cmp-buffer.enable = true;
  cmp-nvim-lsp.enable = true;
  cmp-path.enable = true;
  conform-nvim = import ./conform-nvim.nix;
  bufferline = import ./bufferline.nix;
  indent-blankline = import ./indent-blankline.nix;
  lualine = import ./lualine.nix;
  lsp = import ./lsp.nix;
  mini = import ./mini.nix;
  rainbow-delimiters.enable = false;
  rustaceanvim = import ./rustaceanvim.nix;
  telescope = import ./telescope.nix;
  treesitter = import ./treesitter.nix;
  trouble = import ./trouble.nix;
  which-key = import ./which-key.nix;
}

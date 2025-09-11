{
  aerial = import ./aerial.nix;
  barbecue = import ./barbecue.nix;
  cmp = import ./cmp.nix;
  cmp-buffer.enable = true;
  cmp-nvim-lsp.enable = true;
  cmp-path.enable = true;
  conform-nvim = import ./conform-nvim.nix;
  bufferline = import ./bufferline.nix;
  indent-blankline = import ./indent-blankline.nix;
  lualine = import ./lualine.nix;
  lsp = import ./lsp.nix;
  lsp-lines.enable = true;
  lsp-signature.enable = true;
  mini = import ./mini.nix;
  neo-tree = import ./neo-tree.nix;
  oil = import ./oil.nix;
  rainbow-delimiters.enable = false;
  rustaceanvim = import ./rustaceanvim.nix;
  telescope = import ./telescope.nix;
  treesitter = import ./treesitter.nix;
  trouble = import ./trouble.nix;
  web-devicons.enable = true;
  which-key = import ./which-key.nix;
}

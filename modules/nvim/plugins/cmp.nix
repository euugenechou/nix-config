{
  enable = true;
  autoEnableSources = false;
  settings = {
    completion.completeopt = "menu,menuone,noselect,noinsert";
    sources =
      [ { name = "nvim_lsp"; } { name = "path"; } { name = "buffer"; } ];
    mapping = {
      "<cr>" = "cmp.mapping.confirm({ select = true })";
      "<c-space>" = "cmp.mapping.complete()";
      "<c-e>" = "cmp.mapping.scroll_docs(4)";
      "<c-y>" = "cmp.mapping.scroll_docs(-4)";
      "<c-d>" = "cmp.mapping.close()";
      "<c-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      "<c-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
    };
  };
}

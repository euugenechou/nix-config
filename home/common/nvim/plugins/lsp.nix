{
  enable = true;
  capabilities = ''
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  '';
  keymaps.extra = [
    {
      key = "gd";
      action = "<cmd>Telescope lsp_definitions<cr>";
      options.desc = "goto definition";
    }
    {
      key = "gI";
      action = "<cmd>Telescope lsp_implementations<cr>";
      options.desc = "goto implementation";
    }
    {
      key = "gr";
      action.__raw = "vim.lsp.buf.rename";
      options.desc = "rename symbol";
    }
    {
      key = "gD";
      action.__raw = "vim.lsp.buf.declaration";
      options.desc = "goto declaration";
    }
    {
      key = "gh";
      action.__raw = "vim.lsp.buf.hover";
      options.desc = "hover documentation";
    }
    {
      key = "gK";
      action.__raw = "vim.lsp.buf.signature_help";
      options.desc = "signature help";
    }
    {
      key = "gA";
      action.__raw = "vim.lsp.buf.code_action";
      options.desc = "code action";
    }
  ];
  servers = {
    clangd = {
      enable = true;
    };
    hls = {
      enable = true;
      installGhc = false;
    };
    ruff = {
      enable = true;
    };
    pyright = {
      enable = true;
    };
    zls = {
      enable = true;
    };
    metals = {
      enable = true;
    };
    java_language_server = {
      enable = true;
    };
  };
}

{
  enable = true;
  settings = {
    formatters_by_ft = {
      c = ["clang_format"];
      cpp = ["clang_format"];
      nix = ["alejandra"];
      python = ["black"];
      rust = ["rustfmt"];
      scala = ["scalafmt"];
      markdown = ["prettier"];
      markdown_mdx = ["prettier"];
      "_" = [
        "squeeze_blanks"
        "trim_whitespace"
        "trim_newlines"
      ];
    };
    format_on_save = {
      timeout_ms = 500;
      lsp_format = "never";
    };
  };
}

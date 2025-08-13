{
  enable = true;
  settings = {
    formatters_by_ft = {
      c = ["clang_format"];
      cpp = ["clang_format"];
      python = ["black"];
      nix = ["alejandra"];
      rust = ["rustfmt"];
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

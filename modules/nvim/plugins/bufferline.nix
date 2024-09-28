let colors = import ../colors.nix;
in {
  enable = true;
  settings = {
    options = {
      show_buffer_icons = true;
      show_buffer_close_icons = false;
      show_tab_indicators = true;
      offsets = [{
        filetype = "NvimTree";
        text = "";
        text_align = "center";
      }];
      diagnostics = "nvim_lsp";
      diagnostics_indicator = ''
        function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end
      '';
    };
    highlights = {
      fill = { bg = colors.dark_blue; };
      background = {
        fg = colors.gray;
        bg = colors.dark_blue;
      };
      tab = {
        fg = colors.gray;
        bg = colors.dark_blue;
      };
      tab_selected = {
        fg = colors.fg;
        bg = colors.dark_blue;
      };
      tab_separator = {
        fg = colors.dark_blue;
        bg = colors.dark_blue;
      };
      tab_separator_selected = {
        fg = colors.dark_blue;
        bg = colors.dark_blue;
      };
      tab_close = {
        fg = colors.red;
        bg = colors.dark_blue;
      };
      close_button = { bg = colors.dark_blue; };
      close_button_visible = { bg = colors.dark_blue; };
      close_button_selected = { bg = colors.dark_blue; };
      buffer_visible = {
        fg = colors.gray;
        bg = colors.dark_blue;
      };
      buffer_selected = {
        fg = colors.fg;
        bg = colors.dark_blue;
        bold = true;
        italic = false;
      };
      numbers = { fg = colors.gray; };
      numbers_visible = { fg = colors.gray; };
      numbers_selected = { fg = colors.fg; };
      diagnostic = { bg = colors.dark_blue; };
      diagnostic_visible = { bg = colors.dark_blue; };
      diagnostic_selected = { bg = colors.dark_blue; };
      hint = { bg = colors.dark_blue; };
      hint_visible = { bg = colors.dark_blue; };
      hint_selected = { bg = colors.dark_blue; };
      hint_diagnostic = { bg = colors.dark_blue; };
      hint_diagnostic_visible = { bg = colors.dark_blue; };
      hint_diagnostic_selected = { bg = colors.dark_blue; };
      info = { bg = colors.dark_blue; };
      info_visible = { bg = colors.dark_blue; };
      info_selected = { bg = colors.dark_blue; };
      info_diagnostic = { bg = colors.dark_blue; };
      info_diagnostic_visible = { bg = colors.dark_blue; };
      info_diagnostic_selected = { bg = colors.dark_blue; };
      warning = { bg = colors.dark_blue; };
      warning_visible = { bg = colors.dark_blue; };
      warning_selected = { bg = colors.dark_blue; };
      warning_diagnostic = { bg = colors.dark_blue; };
      warning_diagnostic_visible = { bg = colors.dark_blue; };
      warning_diagnostic_selected = { bg = colors.dark_blue; };
      error = { bg = colors.dark_blue; };
      error_visible = { bg = colors.dark_blue; };
      error_selected = { bg = colors.dark_blue; };
      error_diagnostic = { bg = colors.dark_blue; };
      error_diagnostic_visible = { bg = colors.dark_blue; };
      error_diagnostic_selected = { bg = colors.dark_blue; };
      modified = { bg = colors.dark_blue; };
      modified_visible = { bg = colors.dark_blue; };
      modified_selected = { bg = colors.dark_blue; };
      duplicate = {
        fg = colors.gray;
        bg = colors.dark_blue;
      };
      duplicate_visible = {
        fg = colors.gray;
        bg = colors.dark_blue;
      };
      duplicate_selected = {
        fg = colors.magenta;
        bg = colors.dark_blue;
      };
      separator_selected = {
        fg = colors.dark_blue;
        bg = colors.dark_blue;
      };
      separator_visible = {
        fg = colors.dark_blue;
        bg = colors.dark_blue;
      };
      separator = {
        fg = colors.dark_blue;
        bg = colors.dark_blue;
      };
      indicator_visible = {
        fg = colors.dark_blue;
        bg = colors.dark_blue;
      };
      indicator_selected = {
        fg = colors.dark_blue;
        bg = colors.dark_blue;
      };
      pick_selected = { bg = colors.dark_blue; };
      pick_visible = { bg = colors.dark_blue; };
      pick = { bg = colors.dark_blue; };
      offset_separator = { bg = colors.dark_blue; };
      trunc_marker = {
        fg = colors.fg;
        bg = colors.dark_blue;
      };
    };
  };
}

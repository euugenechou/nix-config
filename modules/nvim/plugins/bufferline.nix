let
  palette = import ../palette.nix;
in {
  enable = true;
  settings = {
    options = {
      show_buffer_icons = true;
      show_buffer_close_icons = false;
      show_tab_indicators = true;
      offsets = [
        {
          filetype = "NvimTree";
          text = "";
          text_align = "center";
        }
      ];
      diagnostics = "nvim_lsp";
      diagnostics_indicator = ''
        function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end
      '';
    };
    highlights = {
      fill = {bg = palette.dark_blue;};
      background = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
      tab = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
      tab_selected = {
        fg = palette.fg;
        bg = palette.dark_blue;
      };
      tab_separator = {
        fg = palette.dark_blue;
        bg = palette.dark_blue;
      };
      tab_separator_selected = {
        fg = palette.dark_blue;
        bg = palette.dark_blue;
      };
      tab_close = {
        fg = palette.red;
        bg = palette.dark_blue;
      };
      close_button = {bg = palette.dark_blue;};
      close_button_visible = {bg = palette.dark_blue;};
      close_button_selected = {bg = palette.dark_blue;};
      buffer_visible = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
      buffer_selected = {
        fg = palette.fg;
        bg = palette.dark_blue;
        bold = true;
        italic = false;
      };
      numbers = {fg = palette.gray;};
      numbers_visible = {fg = palette.gray;};
      numbers_selected = {fg = palette.fg;};
      diagnostic = {bg = palette.dark_blue;};
      diagnostic_visible = {bg = palette.dark_blue;};
      diagnostic_selected = {bg = palette.dark_blue;};
      hint = {bg = palette.dark_blue;};
      hint_visible = {bg = palette.dark_blue;};
      hint_selected = {bg = palette.dark_blue;};
      hint_diagnostic = {bg = palette.dark_blue;};
      hint_diagnostic_visible = {bg = palette.dark_blue;};
      hint_diagnostic_selected = {bg = palette.dark_blue;};
      info = {bg = palette.dark_blue;};
      info_visible = {bg = palette.dark_blue;};
      info_selected = {bg = palette.dark_blue;};
      info_diagnostic = {bg = palette.dark_blue;};
      info_diagnostic_visible = {bg = palette.dark_blue;};
      info_diagnostic_selected = {bg = palette.dark_blue;};
      warning = {bg = palette.dark_blue;};
      warning_visible = {bg = palette.dark_blue;};
      warning_selected = {bg = palette.dark_blue;};
      warning_diagnostic = {bg = palette.dark_blue;};
      warning_diagnostic_visible = {bg = palette.dark_blue;};
      warning_diagnostic_selected = {bg = palette.dark_blue;};
      error = {bg = palette.dark_blue;};
      error_visible = {bg = palette.dark_blue;};
      error_selected = {bg = palette.dark_blue;};
      error_diagnostic = {bg = palette.dark_blue;};
      error_diagnostic_visible = {bg = palette.dark_blue;};
      error_diagnostic_selected = {bg = palette.dark_blue;};
      modified = {bg = palette.dark_blue;};
      modified_visible = {bg = palette.dark_blue;};
      modified_selected = {bg = palette.dark_blue;};
      duplicate = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
      duplicate_visible = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
      duplicate_selected = {
        fg = palette.magenta;
        bg = palette.dark_blue;
      };
      separator_selected = {
        fg = palette.dark_blue;
        bg = palette.dark_blue;
      };
      separator_visible = {
        fg = palette.dark_blue;
        bg = palette.dark_blue;
      };
      separator = {
        fg = palette.dark_blue;
        bg = palette.dark_blue;
      };
      indicator_visible = {
        fg = palette.dark_blue;
        bg = palette.dark_blue;
      };
      indicator_selected = {
        fg = palette.dark_blue;
        bg = palette.dark_blue;
      };
      pick_selected = {bg = palette.dark_blue;};
      pick_visible = {bg = palette.dark_blue;};
      pick = {bg = palette.dark_blue;};
      offset_separator = {bg = palette.dark_blue;};
      trunc_marker = {
        fg = palette.fg;
        bg = palette.dark_blue;
      };
    };
  };
}

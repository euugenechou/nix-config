let
  palette = import ../palette.nix;
  theme = {
    normal = {
      a = {
        fg = palette.blue;
        bg = palette.dark_blue;
        gui = "bold";
      };
      b = {
        fg = palette.fg;
        bg = palette.dark_blue;
        gui = "bold";
      };
      c = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
    };
    insert = {
      a = {
        fg = palette.green;
        bg = palette.dark_blue;
        gui = "bold";
      };
      b = {
        fg = palette.fg;
        bg = palette.dark_blue;
        gui = "bold";
      };
      c = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
    };
    visual = {
      a = {
        fg = palette.magenta;
        bg = palette.dark_blue;
        gui = "bold";
      };
      b = {
        fg = palette.fg;
        bg = palette.dark_blue;
        gui = "bold";
      };
      c = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
    };
    replace = {
      a = {
        fg = palette.red;
        bg = palette.dark_blue;
        gui = "bold";
      };
      b = {
        fg = palette.fg;
        bg = palette.dark_blue;
        gui = "bold";
      };
      c = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
    };
    command = {
      a = {
        fg = palette.yellow;
        bg = palette.dark_blue;
        gui = "bold";
      };
      b = {
        fg = palette.fg;
        bg = palette.dark_blue;
        gui = "bold";
      };
      c = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
    };
    inactive = {
      a = {
        fg = palette.gray;
        bg = palette.dark_blue;
        gui = "bold";
      };
      b = {
        fg = palette.fg;
        bg = palette.dark_blue;
        gui = "bold";
      };
      c = {
        fg = palette.gray;
        bg = palette.dark_blue;
      };
    };
  };
in {
  enable = true;
  settings = {
    options = {
      theme = theme;
      mode = "tabs";
      icons_enabled = false;
      component_separators = {
        left = "|";
        right = "|";
      };
      section_separators = {
        left = "";
        right = "";
      };
    };
    sections = {
      lualine_a = ["mode"];
      lualine_b = ["filename"];
      lualine_c = ["branch"];
      lualine_x = ["encoding" "fileformat" "filetype"];
      lualine_y = ["progress"];
      lualine_z = ["location"];
    };
    inactive_sections = {
      lualine_a = ["filename"];
      lualine_b = [];
      lualine_c = [];
      lualine_x = [];
      lualine_y = [];
      lualine_z = [];
    };
  };
}

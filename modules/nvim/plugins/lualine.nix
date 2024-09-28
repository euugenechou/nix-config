let
  colors = import ../colors.nix;
  theme = {
    normal = {
      a = {
        fg = colors.blue;
        bg = colors.dark_blue;
        gui = "bold";
      };
      b = {
        fg = colors.fg;
        bg = colors.dark_blue;
        gui = "bold";
      };
      c = {
        fg = colors.gray;
        bg = colors.dark_blue;
      };
    };
    insert = {
      a = {
        fg = colors.green;
        bg = colors.dark_blue;
        gui = "bold";
      };
      b = {
        fg = colors.fg;
        bg = colors.dark_blue;
        gui = "bold";
      };
      c = {
        fg = colors.gray;
        bg = colors.dark_blue;
      };
    };
    visual = {
      a = {
        fg = colors.magenta;
        bg = colors.dark_blue;
        gui = "bold";
      };
      b = {
        fg = colors.fg;
        bg = colors.dark_blue;
        gui = "bold";
      };
      c = {
        fg = colors.gray;
        bg = colors.dark_blue;
      };
    };
    replace = {
      a = {
        fg = colors.red;
        bg = colors.dark_blue;
        gui = "bold";
      };
      b = {
        fg = colors.fg;
        bg = colors.dark_blue;
        gui = "bold";
      };
      c = {
        fg = colors.gray;
        bg = colors.dark_blue;
      };
    };
    command = {
      a = {
        fg = colors.yellow;
        bg = colors.dark_blue;
        gui = "bold";
      };
      b = {
        fg = colors.fg;
        bg = colors.dark_blue;
        gui = "bold";
      };
      c = {
        fg = colors.gray;
        bg = colors.dark_blue;
      };
    };
    inactive = {
      a = {
        fg = colors.gray;
        bg = colors.dark_blue;
        gui = "bold";
      };
      b = {
        fg = colors.fg;
        bg = colors.dark_blue;
        gui = "bold";
      };
      c = {
        fg = colors.gray;
        bg = colors.dark_blue;
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
      lualine_a = [ "mode" ];
      lualine_b = [ "filename" ];
      lualine_c = [ "branch" ];
      lualine_x = [ "encoding" "fileformat" "filetype" ];
      lualine_y = [ "progress" ];
      lualine_z = [ "location" ];
    };
    inactive_sections = {
      lualine_a = [ "filename" ];
      lualine_b = [ ];
      lualine_c = [ ];
      lualine_x = [ ];
      lualine_y = [ ];
      lualine_z = [ ];
    };
  };
}

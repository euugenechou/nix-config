{ inputs, pkgs, ... }:
let
  colors = import ./colors.nix;
  aerial = (pkgs.vimUtils.buildVimPlugin {
    name = "aerial";
    src = pkgs.fetchFromGitHub {
      owner = "stevearc";
      repo = "aerial.nvim";
      rev = "140f48fb068d21c02e753c63f7443649e55576f0";
      hash = "sha256-7Sj7Z5blJ6Qk/99EV4EBv4vdK1dHDGFL3WRYLEnrRC0=";
    };
  });
  one-monokai = (pkgs.vimUtils.buildVimPlugin {
    name = "one_monokai";
    src = pkgs.fetchFromGitHub {
      owner = "cpea2506";
      repo = "one_monokai.nvim";
      rev = "18da45f4b0fdfa8ff2c354ac748e03cb910725e6";
      hash = "sha256-Mos98WG05rKHL5sKO7CsLGawFshbf0CUY+5Ki/bFUR8=";
    };
  });
in {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    enableMan = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    colorscheme = "one_monokai";
    globals = import ./globals.nix;
    opts = import ./opts.nix;
    keymaps = import ./keymaps.nix;
    plugins = import ./plugins;
    extraPlugins = [ aerial one-monokai ];
    extraConfigLua = ''
      require('aerial').setup({})
      require('one_monokai').setup({
        transparent = false,
        themes = function(colors)
          -- change highlight of some groups,
          -- the key and value will be passed respectively to "nvim_set_hl"
          return {
            ColorColumn = { bg = "${colors.bg}" },
            Conceal = { fg = "${colors.dark_blue}" },
            CurSearch = { fg = "${colors.magenta}", bg = "${colors.bg}" },
            CursorColumn = { bg = "${colors.bg}" },
            CursorLine = { bg = "${colors.darker_gray}" },
            CursorLineNr = { fg = "${colors.fg}", bg = "${colors.bg}" },
            CursorPmenu = { fg = "${colors.fg}", bg = "${colors.bg}" },
            EndOfBuffer = { fg = "${colors.bg}", bg = "${colors.bg}" },
            IncSearch = { fg = "${colors.magenta}" },
            LineNr = { fg = "${colors.gray}", bg = "${colors.bg}" },
            NonText = { fg = "${colors.bg}", bg = "${colors.bg}" },
            NormalFloat = { bg = "${colors.dark_blue}" },
            Pmenu = { fg = "${colors.fg}", bg = "${colors.dark_blue}" },
            PmenuSbar = { fg = "${colors.gray}", bg = "${colors.dark_blue}" },
            PmenuSel = { bg = "${colors.darker_gray}" },
            Search = { fg = "${colors.magenta}" },
            TabLine = { bg = "${colors.dark_blue}" },
            TabLineFill = { bg = "${colors.dark_blue}" },
            Visual = { bg = "${colors.darker_gray}" },
            VisualNos = { bg = "${colors.darker_gray}" },
            Whitespace = { fg = "${colors.bg}", bg = "${colors.bg}" },
            WinSeparator = { fg = "${colors.darker_gray}", bg = "${colors.bg}" },
            -- different background to avoid carets in status line
            StatusLine = { fg = "${colors.dark_blue}", bg = "${colors.bg}" },
            StatusLineNC = { fg = "${colors.dark_blue}", bg = "${colors.dark_blue}" },
            -- telescope (general)
            TelescopeBorder = { fg = "${colors.dark_blue}", bg = "${colors.dark_blue}" },
            TelescopeNormal = { fg = "${colors.fg}", bg = "${colors.dark_blue}" },
            -- telescope (preview)
            TelescopePreviewBlock = { fg = "${colors.magenta}" },
            TelescopePreviewBorder = { fg = "${colors.dark_blue}", bg = "${colors.dark_blue}" },
            TelescopePreviewCharDev = { fg = "${colors.magenta}" },
            TelescopePreviewDate = { fg = "${colors.blue}" },
            TelescopePreviewDirectory = { fg = "${colors.cyan}" },
            TelescopePreviewExecute = { fg = "${colors.green}" },
            TelescopePreviewGroup = { fg = "${colors.yellow}" },
            TelescopePreviewHyphen = { fg = "${colors.gray}" },
            TelescopePreviewLine = { bg = "${colors.darker_gray}" },
            TelescopePreviewLink = { fg = "${colors.magenta}" },
            TelescopePreviewMessage = { fg = "${colors.magenta}" },
            TelescopePreviewMessageFillchar = { fg = "${colors.magenta}" },
            TelescopePreviewPipe = { fg = "${colors.magenta}" },
            TelescopePreviewRead = { fg = "${colors.yellow}" },
            TelescopePreviewSize = { fg = "${colors.green}" },
            TelescopePreviewSocket = { fg = "${colors.magenta}" },
            TelescopePreviewSticky = { fg = "${colors.fg}" },
            TelescopePreviewUser = { fg = "${colors.yellow}" },
            TelescopePreviewWrite = { fg = "${colors.red}" },
            -- telescope (prompt)
            TelescopePromptBorder = { fg = "${colors.dark_blue}", bg = "${colors.dark_blue}" },
            TelescopePromptCounter = { fg = "${colors.dark_blue}", bg = "${colors.dark_blue}" },
            TelescopePromptPrefix = { fg = "${colors.magenta}", bg = "${colors.dark_blue}" },
            -- telescope (results)
            TelescopeResultsBorder = { fg = "${colors.dark_blue}", bg = "${colors.dark_blue}" },
            TelescopeResultsDiffChange = { fg = "${colors.cyan}" },
            TelescopeResultsDiffAdd = { fg = "${colors.green}" },
            TelescopeResultsDiffDelete = { fg = "${colors.red}" },
            TelescopeResultsDiffUntracked = { fg = "${colors.yellow}" },
            -- telescope (selection)
            TelescopeSelection = { fg = "${colors.magenta}", bg = "${colors.darker_gray}" },
            TelescopeSelectionCaret = { fg = "${colors.magenta}", bg = "${colors.darker_gray}" },
            -- aerial
            AerialLine = { fg = "${colors.magenta}" },
            -- indent-line
            IblIndent = { fg = "${colors.darker_gray}" },
            -- code
            ["@annotation"] = { fg = "${colors.magenta}" },
            ["@attribute"] = { fg = "${colors.magenta}" },
            ["@boolean"] = { fg = "${colors.magenta}" },
            ["@character"] = { fg = "${colors.yellow}" },
            ["@comment"] = { fg = "${colors.gray}" },
            ["@conditional"] = { fg = "${colors.red}" },
            ["@constant"] = { fg = "${colors.magenta}" },
            ["@constant.builtin"] = { fg = "${colors.blue}" },
            ["@constant.macro"] = { fg = "${colors.blue}" },
            ["@constructor"] = { fg = "${colors.green}" },
            ["@exception"] = { fg = "${colors.red}" },
            ["@field"] = { fg = "${colors.orange}" },
            ["@float"] = { fg = "${colors.magenta}" },
            ["@function"] = { fg = "${colors.green}" },
            ["@function.builtin"] = { fg = "${colors.blue}" },
            ["@function.macro"] = { fg = "${colors.blue}" },
            ["@include"] = { fg = "${colors.red}" },
            ["@keyword"] = { fg = "${colors.red}" },
            ["@keyword.function"] = { fg = "${colors.red}" },
            ["@keyword.operator"] = { fg = "${colors.red}" },
            ["@label"] = { fg = "${colors.orange}" },
            ["@method"] = { fg = "${colors.green}" },
            ["@namespace"] = { fg = "${colors.yellow}" },
            ["@none"] = { fg = "${colors.fg}" },
            ["@number"] = { fg = "${colors.magenta}" },
            ["@operator"] = { fg = "${colors.red}" },
            ["@parameter"] = { fg = "${colors.orange}" },
            ["@parameter.reference"] = { fg = "${colors.orange}" },
            ["@property"] = { fg = "${colors.orange}" },
            ["@punctuation.bracket"] = { fg = "${colors.fg}" },
            ["@punctuation.delimiter"] = { fg = "${colors.fg}" },
            ["@punctuation.special"] = { fg = "${colors.blue}" },
            ["@repeat"] = { fg = "${colors.red}" },
            ["@storageclass"] = { fg = "${colors.red}" },
            ["@string"] = { fg = "${colors.yellow}" },
            ["@string.escape"] = { fg = "${colors.yellow}" },
            ["@string.regex"] = { fg = "${colors.yellow}" },
            ["@symbol"] = { fg = "${colors.fg}" },
            ["@tag"] = { fg = "${colors.orange}" },
            ["@tag.delimiter"] = { fg = "${colors.green}" },
            ["@text"] = { fg = "${colors.green}" },
            ["@strike"] = { fg = "${colors.gray}" },
            ["@math"] = { fg = "${colors.blue}" },
            ["@type"] = { fg = "${colors.blue}" },
            ["@type.builtin"] = { fg = "${colors.yellow}" },
            ["@uri"] = { fg = "${colors.blue}" },
            ["@variable"] = { fg = "${colors.fg}" },
            ["@variable.builtin"] = { fg = "${colors.blue}" },
          }
        end,
      })
    '';
  };
}

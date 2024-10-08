let
  palette = import ./palette.nix;
in {
  catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      no_italic = true;
      no_bold = true;
      no_underline = true;
      integrations = {
        aerial = true;
        cmp = true;
        indent_blankline.enabled = true;
        lsp_trouble = true;
        mini.enabled = true;
        native_lsp.enabled = true;
        telescope.enabled = true;
        treesitter = true;
        which_key = true;
      };
      color_overrides = {
        mocha = {
          rosewater = "${palette.red}";
          flamingo = "${palette.red}";
          red = "${palette.red}";
          maroon = "${palette.red}";
          pink = "${palette.magenta}";
          mauve = "${palette.magenta}";
          peach = "${palette.orange}";
          yellow = "${palette.yellow}";
          green = "${palette.green}";
          teal = "${palette.cyan}";
          sky = "${palette.cyan}";
          sapphire = "${palette.cyan}";
          blue = "${palette.blue}";
          lavender = "${palette.blue}";
          text = "${palette.fg}";
          subtext1 = "${palette.fg}";
          subtext0 = "${palette.fg}";
          overlay2 = "${palette.light_gray}";
          overlay1 = "${palette.light_gray}";
          overlay0 = "${palette.gray}";
          surface2 = "${palette.gray}";
          surface1 = "${palette.gray}";
          surface0 = "${palette.darker_gray}";
          base = "${palette.bg}";
          mantle = "${palette.bg}";
          crust = "${palette.bg}";
        };
      };
      custom_highlights.__raw = ''
        function(colors)
          return {
            Comment = { fg = colors.surface2 },
            CursorLineNr = { fg = colors.text },
            FloatBorder = { fg = colors.surface0, bg = colors.base },
            LineNr = { fg = colors.overlay0 },
            LspInfoBorder = { link = "FloatBorder" },
            NormalFloat = { bg = colors.base },
            Pmenu = { fg = "", bg = colors.mantle },
            PmenuSel = { fg = "", bg = colors.surface0 },
            VertSplit = { fg = colors.surface0, bg = colors.base },
            Visual = { fg = "", bg = colors.surface0 },

            NeoTreeDirectoryIcon = { fg = colors.subtext1 },
            NeoTreeDirectoryName = { fg = colors.subtext1 },
            NeoTreeFloatBorder = { link = "TelescopeResultsBorder" },
            NeoTreeGitConflict = { fg = colors.red },
            NeoTreeGitDeleted = { fg = colors.red },
            NeoTreeGitIgnored = { fg = colors.overlay0 },
            NeoTreeGitModified = { fg = colors.peach },
            NeoTreeGitStaged = { fg = colors.green },
            NeoTreeGitUnstaged = { fg = colors.red },
            NeoTreeGitUntracked = { fg = colors.green },
            NeoTreeIndent = { fg = colors.surface1 },
            NeoTreeNormal = { bg = colors.mantle },
            NeoTreeNormalNC = { bg = colors.mantle },
            NeoTreeRootName = { fg = colors.subtext1 },
            NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
            NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
            NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
            NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
            NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },

            TelescopePreviewBorder = { fg = colors.crust, bg = colors.crust },
            TelescopePreviewNormal = { bg = colors.crust },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
            TelescopePreviewLine = { bg = colors.surface0 },
            TelescopePromptBorder = { fg = colors.surface0, bg = colors.surface0 },
            TelescopePromptCounter = { fg = colors.text },
            TelescopePromptNormal = { bg = colors.surface0 },
            TelescopePromptPrefix = { bg = colors.surface0 },
            TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
            TelescopeResultsBorder = { fg = colors.mantle, bg = colors.mantle },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
            TelescopeSelection = { bg = colors.surface0 },
            TelescopeSelectionCaret = { fg = colors.red, bg = colors.surface0 },

            TroubleCount = { fg = colors.text, bg = colors.surface0 },
            TroublePreview = { bg = colors.surface0 },

            CmpItemMenu = { fg = colors.surface2 },
            FidgetTask = { fg = colors.subtext2 },
            FidgetTitle = { fg = colors.peach },
            GitSignsChange = { fg = colors.peach },
            WhichKeyFloat = { bg = colors.mantle },
            YankHighlight = { bg = colors.surface2 },

            IblIndent = { fg = colors.surface0 },
            IblScope = { fg = colors.overlay0 },

            Boolean = { fg = colors.mauve },
            Number = { fg = colors.mauve },
            Float = { fg = colors.mauve },

            PreProc = { fg = colors.red },
            PreCondit = { fg = colors.red },
            Include = { fg = colors.red },
            Define = { fg = colors.red },
            Conditional = { fg = colors.red },
            Repeat = { fg = colors.red },
            Keyword = { fg = colors.red },
            Typedef = { fg = colors.red },
            Exception = { fg = colors.red },
            Statement = { fg = colors.red },

            Error = { fg = colors.red },
            StorageClass = { fg = colors.red },
            Tag = { fg = colors.red },
            Label = { fg = colors.red },
            Structure = { fg = colors.red },
            Operator = { fg = colors.red },
            Title = { fg = colors.red },
            Special = { fg = colors.yellow },
            SpecialChar = { fg = colors.yellow },
            Type = { fg = colors.blue },
            Function = { fg = colors.green },
            Delimiter = { fg = colors.text },
            Ignore = { fg = colors.text },
            Macro = { fg = colors.blue },

            TSAnnotation = { fg = colors.red },
            TSAttribute = { fg = colors.red },
            TSBoolean = { fg = colors.mauve },
            TSCharacter = { fg = colors.yellow },
            TSCharacterSpecial = { link = "SpecialChar" },
            TSComment = { link = "Comment" },
            TSConditional = { fg = colors.red },
            TSConstBuiltin = { fg = colors.blue },
            TSConstMacro = { fg = colors.green },
            TSConstant = { fg = colors.blue },
            TSConstructor = { fg = colors.green },
            TSDebug = { link = "Debug" },
            TSDefine = { link = "Define" },
            TSEnvironment = { link = "Macro" },
            TSEnvironmentName = { link = "Type" },
            TSError = { link = "Error" },
            TSException = { fg = colors.red },
            TSField = { fg = colors.text },
            TSFloat = { fg = colors.mauve },
            TSFuncBuiltin = { fg = colors.green },
            TSFuncMacro = { fg = colors.green },
            TSFunction = { fg = colors.green },
            TSFunctionCall = { fg = colors.green },
            TSInclude = { fg = colors.red },
            TSKeyword = { fg = colors.red },
            TSKeywordFunction = { fg = colors.red },
            TSKeywordOperator = { fg = colors.red },
            TSKeywordReturn = { fg = colors.red },
            TSLabel = { fg = colors.red },
            TSLiteral = { link = "String" },
            TSMath = { fg = colors.blue },
            TSMethod = { fg = colors.green },
            TSMethodCall = { fg = colors.green },
            TSNamespace = { fg = colors.text },
            TSNone = { fg = colors.text },
            TSNumber = { fg = colors.mauve },
            TSOperator = { fg = colors.red },
            TSParameter = { fg = colors.peach },
            TSParameterReference = { fg = colors.peach },
            TSPreProc = { link = "PreProc" },
            TSProperty = { fg = colors.text },
            TSPunctBracket = { fg = colors.text },
            TSPunctDelimiter = { link = "Delimiter" },
            TSPunctSpecial = { fg = colors.mauve },
            TSRepeat = { fg = colors.red },
            TSStorageClass = { fg = colors.red },
            TSStorageClassLifetime = { fg = colors.red },
            TSStrike = { fg = colors.text },
            TSString = { fg = colors.yellow },
            TSStringEscape = { fg = colors.green },
            TSStringRegex = { fg = colors.green },
            TSStringSpecial = { link = "SpecialChar" },
            TSSymbol = { fg = colors.text },
            TSTag = { fg = colors.red },
            TSTagAttribute = { fg = colors.green },
            TSTagDelimiter = { fg = colors.green },
            TSText = { fg = colors.text },
            TSTextReference = { link = "Constant" },
            TSTitle = { link = "Title" },
            TSTodo = { link = "Todo" },
            TSType = { fg = colors.blue },
            TSTypeBuiltin = { fg = colors.blue },
            TSTypeDefinition = { fg = colors.blue },
            TSTypeQualifier = { fg = colors.blue },
            TSURI = { fg = colors.blue },
            TSVariable = { fg = colors.text },
            TSVariableBuiltin = { fg = colors.red },

            ["@annotation"] = { link = "TSAnnotation" },
            ["@attribute"] = { link = "TSAttribute" },
            ["@boolean"] = { link = "TSBoolean" },
            ["@character"] = { link = "TSCharacter" },
            ["@character.special"] = { link = "TSCharacterSpecial" },
            ["@comment"] = { link = "TSComment" },
            ["@conceal"] = { link = "Grey" },
            ["@conditional"] = { link = "TSConditional" },
            ["@constant"] = { link = "TSConstant" },
            ["@constant.builtin"] = { link = "TSConstBuiltin" },
            ["@constant.macro"] = { link = "TSConstMacro" },
            ["@constructor"] = { link = "TSConstructor" },
            ["@debug"] = { link = "TSDebug" },
            ["@define"] = { link = "TSDefine" },
            ["@error"] = { link = "TSError" },
            ["@exception"] = { link = "TSException" },
            ["@field"] = { link = "TSField" },
            ["@float"] = { link = "TSFloat" },
            ["@function"] = { link = "TSFunction" },
            ["@function.builtin"] = { link = "TSFuncBuiltin" },
            ["@function.call"] = { link = "TSFunctionCall" },
            ["@function.macro"] = { link = "TSFuncMacro" },
            ["@include"] = { link = "TSInclude" },
            ["@keyword"] = { link = "TSKeyword" },
            ["@keyword.function"] = { link = "TSKeywordFunction" },
            ["@keyword.operator"] = { link = "TSKeywordOperator" },
            ["@keyword.return"] = { link = "TSKeywordReturn" },
            ["@label"] = { link = "TSLabel" },
            ["@math"] = { link = "TSMath" },
            ["@method"] = { link = "TSMethod" },
            ["@method.call"] = { link = "TSMethodCall" },
            ["@namespace"] = { link = "TSNamespace" },
            ["@none"] = { link = "TSNone" },
            ["@number"] = { link = "TSNumber" },
            ["@operator"] = { link = "TSOperator" },
            ["@parameter"] = { link = "TSParameter" },
            ["@parameter.reference"] = { link = "TSParameterReference" },
            ["@preproc"] = { link = "TSPreProc" },
            ["@property"] = { link = "TSProperty" },
            ["@punctuation.bracket"] = { link = "TSPunctBracket" },
            ["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
            ["@punctuation.special"] = { link = "TSPunctSpecial" },
            ["@repeat"] = { link = "TSRepeat" },
            ["@storageclass"] = { link = "TSStorageClass" },
            ["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
            ["@strike"] = { link = "TSStrike" },
            ["@string"] = { link = "TSString" },
            ["@string.escape"] = { link = "TSStringEscape" },
            ["@string.regex"] = { link = "TSStringRegex" },
            ["@string.special"] = { link = "TSStringSpecial" },
            ["@symbol"] = { link = "TSSymbol" },
            ["@tag"] = { link = "TSTag" },
            ["@tag.attribute"] = { link = "TSTagAttribute" },
            ["@tag.delimiter"] = { link = "TSTagDelimiter" },
            ["@text"] = { link = "TSText" },
            ["@text.danger"] = { link = "TSDanger" },
            ["@text.diff.add"] = { link = "diffAdded" },
            ["@text.diff.delete"] = { link = "diffRemoved" },
            ["@text.emphasis"] = { link = "TSEmphasis" },
            ["@text.environment"] = { link = "TSEnvironment" },
            ["@text.environment.name"] = { link = "TSEnvironmentName" },
            ["@text.literal"] = { link = "TSLiteral" },
            ["@text.math"] = { link = "TSMath" },
            ["@text.note"] = { link = "TSNote" },
            ["@text.reference"] = { link = "TSTextReference" },
            ["@text.strike"] = { link = "TSStrike" },
            ["@text.strong"] = { link = "TSStrong" },
            ["@text.title"] = { link = "TSTitle" },
            ["@text.todo"] = { link = "TSTodo" },
            ["@text.todo.checked"] = { link = "Green" },
            ["@text.todo.unchecked"] = { link = "Ignore" },
            ["@text.underline"] = { link = "TSUnderline" },
            ["@text.uri"] = { link = "TSURI" },
            ["@text.warning"] = { link = "TSWarning" },
            ["@todo"] = { link = "TSTodo" },
            ["@type"] = { link = "TSType" },
            ["@type.builtin"] = { link = "TSTypeBuiltin" },
            ["@type.definition"] = { link = "TSTypeDefinition" },
            ["@type.qualifier"] = { link = "TSTypeQualifier" },
            ["@uri"] = { link = "TSURI" },
            ["@variable"] = { link = "TSVariable" },
            ["@variable.builtin"] = { link = "TSVariableBuiltin" },

            ["@lsp.type.class"] = { link = "TSType" },
            ["@lsp.type.comment"] = { link = "TSComment" },
            ["@lsp.type.decorator"] = { link = "TSFunction" },
            ["@lsp.type.enum"] = { link = "TSType" },
            ["@lsp.type.enumMember"] = { link = "TSProperty" },
            ["@lsp.type.events"] = { link = "TSLabel" },
            ["@lsp.type.function"] = { link = "TSFunction" },
            ["@lsp.type.interface"] = { link = "TSType" },
            ["@lsp.type.keyword"] = { link = "TSKeyword" },
            ["@lsp.type.macro"] = { link = "TSConstMacro" },
            ["@lsp.type.method"] = { link = "TSMethod" },
            ["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
            ["@lsp.type.namespace"] = { link = "TSNamespace" },
            ["@lsp.type.number"] = { link = "TSNumber" },
            ["@lsp.type.operator"] = { link = "TSOperator" },
            ["@lsp.type.parameter"] = { link = "TSParameter" },
            ["@lsp.type.property"] = { link = "TSProperty" },
            ["@lsp.type.regexp"] = { link = "TSStringRegex" },
            ["@lsp.type.string"] = { link = "TSString" },
            ["@lsp.type.struct"] = { link = "TSType" },
            ["@lsp.type.type"] = { link = "TSType" },
            ["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
            ["@lsp.type.variable"] = { link = "TSVariable" },
          }
        end
      '';
    };
  };
}

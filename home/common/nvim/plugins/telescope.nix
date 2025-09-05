{
  enable = true;
  extensions = {fzf-native.enable = true;};
  enabledExtensions = ["aerial"];
  settings = {
    defaults = {
      prompt_prefix = "   ";
      entry_prefix = "  ";
      initial_mode = "insert";
      selection_strategy = "reset";
      sorting_strategy = "ascending";
      layout_strategy = "horizontal";
      layout_config = {
        horizontal = {
          preview_width = 0.5;
          results_width = 0.8;
        };
        vertical = {mirror = false;};
        width = 0.8;
        height = 0.8;
      };
      mappings = {
        i = {
          "<C-j>".__raw = "require('telescope.actions').move_selection_next";
          "<C-k>".__raw = "require('telescope.actions').move_selection_previous";
          "<C-n>".__raw = "require('telescope.actions').cycle_history_next";
          "<C-p>".__raw = "require('telescope.actions').cycle_history_prev";
          "<C-e>".__raw = "require('telescope.actions').preview_scrolling_down";
          "<C-y>".__raw = "require('telescope.actions').preview_scrolling_up";
        };
        n = {
          "<C-j>".__raw = "require('telescope.actions').move_selection_next";
          "<C-k>".__raw = "require('telescope.actions').move_selection_previous";
          "<C-e>".__raw = "require('telescope.actions').preview_scrolling_down";
          "<C-y>".__raw = "require('telescope.actions').preview_scrolling_up";
          "<C-c>".__raw = "require('telescope.actions').close";
        };
      };
    };
  };
  keymaps = {
    "<leader>fa" = {
      action = "autocommands";
      options.desc = "list autocommands";
    };
    "<leader>fb" = {
      action = "buffers";
      options.desc = "list buffers";
    };
    "<leader>fc" = {
      action = "command_history";
      options.desc = "command history";
    };
    "<leader>fd" = {
      action = "diagnostics";
      options.desc = "list diagnostics";
    };
    "<leader>ff" = {
      action = "find_files";
      options.desc = "find files";
    };
    "<leader>fi" = {
      action = "current_buffer_fuzzy_find";
      options.desc = "find in buffer";
    };
    "<leader>fl" = {
      action = "jumplist";
      options.desc = "jumplist";
    };
    "<leader>fr" = {
      action = "lsp_references";
      options.desc = "references";
    };
    "<leader>fw" = {
      action = "live_grep";
      options.desc = "find word";
    };
    "<leader>fs" = {
      action = "aerial";
      options.desc = "find symbol";
    };
  };
}

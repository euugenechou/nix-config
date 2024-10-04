[
  # too used to this escapism
  {
    key = "jj";
    action = "<esc>";
    mode = ["i"];
  }
  # don't move
  {
    key = "<space>";
    action = "<nop>";
    mode = ["n" "v"];
  }
  # better up/down
  {
    key = "j";
    action = "v:count == 0 ? 'gj' : 'j'";
    mode = ["n"];
    options = {
      expr = true;
      silent = true;
    };
  }
  {
    key = "k";
    action = "v:count == 0 ? 'gk' : 'k'";
    mode = ["n"];
    options = {
      expr = true;
      silent = true;
    };
  }
  # horizontal line movement
  {
    key = "<C-h>";
    action = "<<";
    mode = ["n"];
    options.silent = true;
  }
  {
    key = "<C-h>";
    action = "<gv";
    mode = ["v"];
    options.silent = true;
  }
  {
    key = "<C-l>";
    action = ">>";
    mode = ["n"];
    options.silent = true;
  }
  {
    key = "<C-h>";
    action = ">gv";
    mode = ["v"];
    options.silent = true;
  }
  # quitting/saving
  {
    key = "<leader>q";
    action = ":q<cr>";
    mode = ["n"];
    options.desc = "quit";
  }
  {
    key = "<leader>w";
    action = ":w<cr>";
    mode = ["n"];
    options.desc = "save";
  }
  {
    key = "<leader>e";
    action = ":x<cr>";
    mode = ["n"];
    options.desc = "save and quit";
  }
  # trouble
  {
    key = "<leader>tt";
    action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
    mode = ["n"];
    options.desc = "buffer diagnostics";
  }
  {
    key = "<leader>tT";
    action = "<cmd>Trouble diagnostics toggle<cr>";
    mode = ["n"];
    options.desc = "workspace diagnostics";
  }
  {
    key = "<leader>tl";
    action = "<cmd>Trouble loclist toggle<cr>";
    mode = ["n"];
    options.desc = "location list";
  }
  {
    key = "<leader>tq";
    action = "<cmd>Trouble qflist toggle<cr>";
    mode = ["n"];
    options.desc = "quickfix list";
  }
  # bufferline
  {
    key = "H";
    action = "<cmd>BufferLineCyclePrev<cr>";
    mode = ["n"];
    options.desc = "cycle to previous buffer";
  }
  {
    key = "L";
    action = "<cmd>BufferLineCycleNext<cr>";
    mode = ["n"];
    options.desc = "cycle to next buffer";
  }
  {
    key = "<leader>j";
    action = "<cmd>bp | sp | bn | bd<cr>";
    mode = ["n"];
    options.desc = "close buffer";
  }
  {
    key = "<leader>1";
    action = "<cmd>BufferLineGoToBuffer1<cr>";
    mode = ["n"];
    options.desc = "switch to buffer 1";
  }
  {
    key = "<leader>2";
    action = "<cmd>BufferLineGoToBuffer2<cr>";
    mode = ["n"];
    options.desc = "switch to buffer 2";
  }
  {
    key = "<leader>3";
    action = "<cmd>BufferLineGoToBuffer3<cr>";
    mode = ["n"];
    options.desc = "switch to buffer 3";
  }
  {
    key = "<leader>4";
    action = "<cmd>BufferLineGoToBuffer4<cr>";
    mode = ["n"];
    options.desc = "switch to buffer 4";
  }
  {
    key = "<leader>5";
    action = "<cmd>BufferLineGoToBuffer5<cr>";
    mode = ["n"];
    options.desc = "switch to buffer 5";
  }
  {
    key = "<leader>6";
    action = "<cmd>BufferLineGoToBuffer6<cr>";
    mode = ["n"];
    options.desc = "switch to buffer 6";
  }
  {
    key = "<leader>7";
    action = "<cmd>BufferLineGoToBuffer7<cr>";
    mode = ["n"];
    options.desc = "switch to buffer 7";
  }
  {
    key = "<leader>8";
    action = "<cmd>BufferLineGoToBuffer8<cr>";
    mode = ["n"];
    options.desc = "switch to buffer 8";
  }
  {
    key = "<leader>9";
    action = "<cmd>BufferLineGoToBuffer9<cr>";
    mode = ["n"];
    options.desc = "switch to buffer 9";
  }
  # aerial
  {
    key = "<leader>at";
    action = "<cmd>AerialToggle<cr>";
    options.desc = "toggle sidebar";
  }
  {
    key = "<leader>aw";
    action = "<cmd>AerialNavToggle<cr>";
    options.desc = "toggle navigation window";
  }
  {
    key = "<leader>an";
    action = "<cmd>AerialNext<cr>";
    options.desc = "jump to next symbol";
  }
  {
    key = "<leader>ap";
    action = "<cmd>AerialPrev<cr>";
    options.desc = "jump to previous symbol";
  }
  # oil
  {
    key = "<leader>po";
    action = "<cmd>Oil .<cr>";
    options.desc = "open current directory";
  }
  {
    key = "<leader>pp";
    action = "<cmd>Oil<cr>";
    options.desc = "open parent directory";
  }
]

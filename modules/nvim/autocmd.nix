[
  # check if file should be reloaded
  # strip trailing blank/whitespace-only lines
  {
    event = ["FocusGained" "TermClose" "TermLeave"];
    command = "checktime";
  }
  # highlight yanks
  {
    event = "TextYankPost";
    callback.__raw = "vim.highlight.on_yank()";
  }
]

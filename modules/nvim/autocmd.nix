[
  # strip whitespace
  {
    event = [ "BufWritePre" "FileWritePre" ];
    command = "%s/\\s\\+$//e";
  }
  # strip trailing blank/whitespace-only lines
  {
    event = [ "BufWritePre" "FileWritePre" ];
    command = ":%s#\\($\\n\\s*\\)\\+\\%$##e";
  }
  # check if file should be reloaded
  # strip trailing blank/whitespace-only lines
  {
    event = [ "FocusGained" "TermClose" "TermLeave" ];
    command = "checktime";
  }
  # highlight yanks
  {
    event = "TextYankPost";
    callback = "vim.highlight.on_yank";
  }
]

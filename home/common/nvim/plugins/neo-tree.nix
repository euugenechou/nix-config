{
  enable = true;
  settings = {
    close_if_last_window = true;
    enable_diagnostics = true;
    enable_git_status = true;
    enable_modified_markers = true;
    enable_refresh_on_write = true;
    hide_root_node = true;
    filesystem = {
      follow_current_file.enabled = true;
      filtered_items = {
        visible = true;
        hide_dotfiles = false;
        hide_gitignored = true;
        hide_by_name = [".git" ".DS_STORE"];
        force_visible_in_empty_folder = true;
      };
    };
    window = {
      auto_expand_width = true;
      width = 30;
    };
  };
}

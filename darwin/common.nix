{
  self,
  pkgs,
  ...
}: {
  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [git vim];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "uninstall";
    };
    taps = ["nikitabobko/tap"];
    brews = [];
    casks = [
      "aerospace"
      "alacritty"
      "anki"
      "discord"
      "firefox"
      "font-fira-code-nerd-font"
      "font-hack-nerd-font"
      "flux"
      "ghidra"
      "google-chrome"
      "iina"
      "iterm2"
      "macfuse"
      "mactex"
      "mgba"
      "r"
      "rstudio"
      "skim"
      "spotify"
      "steam"
      "temurin"
      "utm"
      "visual-studio-code"
      "wezterm"
      "zoom"
      "zotero"
    ];
  };

  security.pam.enableSudoTouchIdAuth = true;

  system = {
    defaults.NSGlobalDomain.NSWindowShouldDragOnGesture = true;
    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 5;
  };
}

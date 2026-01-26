{
  self,
  pkgs,
  username,
  ...
}: {
  nix.enable = false;
  nix.settings.experimental-features = "nix-command flakes";

  security.pam.services.sudo_local = {
    touchIdAuth = true;
    watchIdAuth = true;
    reattach = true;
  };

  environment.systemPackages = with pkgs; [git vim];

  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    taps = ["nikitabobko/tap"];
    brews = [];
    casks = [
      "1password-cli"
      "aerospace"
      "alacritty"
      "anki"
      "discord"
      "firefox"
      "font-fira-code-nerd-font"
      "font-hack-nerd-font"
      "flux-app"
      "ghidra"
      "ghostty"
      "google-chrome"
      "iina"
      "iterm2"
      {
        name = "librewolf";
        args.no_quarantine = true;
      }
      "macfuse"
      "mactex"
      "mgba-app"
      "obsidian"
      "protonvpn"
      "r-app"
      "rstudio"
      "skim"
      "spotify"
      "steam"
      "temurin"
      "utm"
      "visual-studio-code"
      "wezterm"
      "xquartz"
      "zoom"
      "zotero"
    ];
  };
}

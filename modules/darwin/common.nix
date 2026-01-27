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
      "alacritty"
      "anki"
      "discord"
      "firefox"
      "font-fira-code-nerd-font"
      "font-hack-nerd-font"
      "flux-app"
      "ghostty"
      "google-chrome"
      "iina"
      "macfuse"
      "mactex"
      "mgba-app"
      "nordvpn"
      "obsidian"
      "r-app"
      "rstudio"
      "skim"
      "spotify"
      "steam"
      "utm"
      "visual-studio-code"
      "xquartz"
      "zoom"
      "zotero"
    ];
  };

  networking.hostName = "gongaga";

  system = {
    defaults = {
      dock = {
        autohide = true;
        magnification = true;
        largesize = 80;
        tilesize = 58;
        persistent-apps = [
          {app = "/Applications/Firefox.app/";}
          {app = "/System/Applications/Messages.app/";}
          {app = "/Applications/Spotify.app/";}
          {app = "/System/Applications/Music.app/";}
          {app = "/Applications/Alacritty.app/";}
          {app = "/Applications/Skim.app/";}
          {app = "/Applications/Obsidian.app/";}
          {app = "/Applications/Zotero.app/";}
          {app = "/System/Applications/Mail.app/";}
          {app = "/System/Applications/System Settings.app";}
        ];
        persistent-others = [];
        show-recents = false;
      };

      finder = {
        FXPreferredViewStyle = "clmv";
      };

      controlcenter = {
        Bluetooth = true;
        Sound = true;
        NowPlaying = false;
      };

      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleIconAppearanceTheme = "RegularDark";
        AppleShowScrollBars = "Automatic";
        ApplePressAndHoldEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  services = {
    aerospace = {
      enable = true;
      settings = {
        gaps = {
          inner.horizontal = 10;
          inner.vertical = 10;
          outer.left = 10;
          outer.bottom = 10;
          outer.top = 10;
          outer.right = 10;
        };
        mode.main.binding = {
          ctrl-space = "mode alt";
        };
        mode.alt.binding = {
          esc = "mode main";
          space = "mode main";
          semicolon = ["reload-config" "mode main"];
          backspace = ["close-all-windows-but-current" "mode main"];
          r = "mode resize";
          w = "mode workspace";
          t = "mode tiling";
          a = "mode applications";
          "1" = ["workspace 1" "mode main"];
          "2" = ["workspace 2" "mode main"];
          "3" = ["workspace 3" "mode main"];
          "4" = ["workspace 4" "mode main"];
          "5" = ["workspace 5" "mode main"];
          "6" = ["workspace 6" "mode main"];
          "7" = ["workspace 7" "mode main"];
          "8" = ["workspace 8" "mode main"];
          "9" = ["workspace 9" "mode main"];
          "shift-1" = ["move-node-to-workspace 1" "mode main"];
          "shift-2" = ["move-node-to-workspace 2" "mode main"];
          "shift-3" = ["move-node-to-workspace 3" "mode main"];
          "shift-4" = ["move-node-to-workspace 4" "mode main"];
          "shift-5" = ["move-node-to-workspace 5" "mode main"];
          "shift-6" = ["move-node-to-workspace 6" "mode main"];
          "shift-7" = ["move-node-to-workspace 7" "mode main"];
          "shift-8" = ["move-node-to-workspace 8" "mode main"];
          "shift-9" = ["move-node-to-workspace 9" "mode main"];
          h = ["focus left" "mode main"];
          j = ["focus down" "mode main"];
          k = ["focus up" "mode main"];
          l = ["focus right" "mode main"];
          shift-h = ["move left" "mode main"];
          shift-j = ["move down" "mode main"];
          shift-k = ["move up" "mode main"];
          shift-l = ["move right" "mode main"];
          ctrl-h = ["join-with left" "mode main"];
          ctrl-j = ["join-with down" "mode main"];
          ctrl-k = ["join-with up" "mode main"];
          ctrl-l = ["join-with right" "mode main"];
        };
        mode.resize.binding = {
          esc = "mode main";
          space = "mode main";
          j = "resize smart -50";
          k = "resize smart +50";
          equal = ["balance-sizes" "mode main"];
        };
        mode.workspace.binding = {
          esc = "mode main";
          space = "mode main";
          h = ["focus-monitor left" "mode main"];
          j = ["focus-monitor down" "mode main"];
          k = ["focus-monitor up" "mode main"];
          l = ["focus-monitor right" "mode main"];
          shift-h = ["move-node-to-monitor left" "focus-monitor left" "mode main"];
          shift-j = ["move-node-to-monitor down" "focus-monitor down" "mode main"];
          shift-k = ["move-node-to-monitor up" "focus-monitor up" "mode main"];
          shift-l = ["move-node-to-monitor right" "focus-monitor right" "mode main"];
          o = ["workspace prev" "mode main"];
          i = ["workspace next" "mode main"];
          shift-o = ["move-node-to-workspace prev" "mode main"];
          shift-i = ["move-node-to-workspace next" "mode main"];
          shift-p = ["move-workspace-to-monitor prev" "mode main"];
          shift-n = ["move-workspace-to-monitor next" "mode main"];
        };
        mode.tiling.binding = {
          esc = "mode main";
          space = "mode main";
          r = ["flatten-workspace-tree" "mode main"];
          f = ["layout floating tiling" "mode main"];
          t = ["layout tiles horizontal vertical" "mode main"];
          a = ["layout accordion horizontal vertical" "mode main"];
        };
        mode.applications.binding = {
          esc = "mode main";
          space = "mode main";
          a = ["exec-and-forget open -a \"Alacritty\"" "mode main"];
          s = ["exec-and-forget open -a \"Firefox\"" "mode main"];
          d = ["exec-and-forget open -a \"Discord\"" "mode main"];
          m = ["exec-and-forget open -a \"Messages\"" "mode main"];
          l = ["exec-and-forget open -a \"Slack\"" "mode main"];
          e = ["exec-and-forget open -a \"Visual Studio Code\"" "mode main"];
          n = ["exec-and-forget open -a \"Music\"" "mode main"];
        };
        on-window-detected = [
          {
            "if".app-id = "com.apple.Music";
            run = "layout floating";
          }
        ];
      };
    };
  };
}

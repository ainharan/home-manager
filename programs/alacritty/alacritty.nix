{ pkgs, ... }:

{
  # This 'enable' option tells Home Manager to enable and configure Alacritty.
  enable = true;

  # The 'settings' attribute defines the contents of your Alacritty configuration file.
  settings = {
    # --- Font Configuration ---
    font = {
      normal = {
        family = "JetBrainsMono Nerd Font"; # Ensure this font is installed
        style = "Regular";
      };
      bold = {
        family = "JetBrainsMono Nerd Font";
        style = "Bold";
      };
      italic = {
        family = "JetBrainsMono Nerd Font";
        style = "Italic";
      };
      size = 12;
    };

    # --- Color Scheme (Example: Catppuccin Mocha) ---
    colors = {
      primary = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };
      cursor = {
        text = "#1e1e2e";
        cursor = "#f5e0dc";
      };
      normal = {
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
      };
      bright = {
        black = "#585b70";
        red = "#ed8796";
        green = "#a6e3a1";
        yellow = "#eed49f";
        blue = "#89b4fa";
        magenta = "#cba6f7";
        cyan = "#94e2d5";
        white = "#a6adc8";
      };
    };

    # --- Window Configuration ---
    window = {
      opacity = 1.0;
      padding = {
        x = 5;
        y = 5;
      };
    };

    # --- TERMINAL Configuration (Corrected Section) ---
    terminal = {
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = [ "-l" ];
      };
    };

    # --- Other Settings (optional) ---
    selection = {
      save_to_clipboard = true;
    };
    cursor = {
      style = {
        shape = "Block";
        blinking = "On";
      };
    };
    scrolling = {
      history = 10000;
    };
  };
}

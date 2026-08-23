{ pkgs, ... }:

{
  enable = true;

  # Force default shell path
  shell = "${pkgs.zsh}/bin/zsh";

  aggressiveResize = true;
  baseIndex = 1;
  disableConfirmationPrompt = true;
  keyMode = "vi";
  newSession = true;
  secureSocket = true;
  shortcut = "a";

  plugins = with pkgs.tmuxPlugins; [
    {
      plugin = catppuccin;
      extraConfig = ''
        # CONSOLIDATED TRUE COLOR FIXES:
        set -g default-terminal "tmux-256color"
        set -ga terminal-overrides ",alacritty:RGB"
        set -ga terminal-overrides ",*256col*:RGB"

        set -g @catppuccin_flavor 'frappe'
        set -g @catppuccin_window_tabs_enabled on
        set -g @catppuccin_date_time "%H:%M"
      '';
    }
    cpu
  ];

  extraConfig = ''
    # Force tmux panes to invoke zsh directly upon pane startup
    set -g default-command "${pkgs.zsh}/bin/zsh"

    # use C-a, since it's on the home row and easier to hit than C-b
    set-option -g prefix C-a
    unbind-key C-a
    bind-key C-a send-prefix
    set -g base-index 1
    
    # Makes pressing ESC in Neovim happen without delay
    set-option -sg escape-time 10
    
    # mouse behavior
    setw -g mouse on
    
    setw -g status-keys vi
    setw -g mode-keys vi
    
    bind-key : command-prompt
    bind-key r refresh-client
    bind-key L clear-history
    
    # use vim-like keys for splits and windows
    bind-key v split-window -h
    bind-key s split-window -v
    
    bind-key h select-pane -L
    bind-key j select-pane -D
    bind-key k select-pane -U
    bind-key l select-pane -R
    
    # resize the pane
    bind-key -r J resize-pane -D 3
    bind-key -r K resize-pane -U 3
    bind-key -r H resize-pane -L 3
    bind-key -r L resize-pane -R 3
    
    # Setup 'v' to begin selection as in Vim
    bind -T copy-mode-vi v send -X begin-selection
    bind -T copy-mode-vi y send -X copy-pipe "reattach-to-user-namespace pbcopy"\; display-message "copied to system clipboard"
    bind -T copy-mode-vi DoubleClick1Pane select-pane\; send -X select-word\; send -X stop-selection
  '';
}

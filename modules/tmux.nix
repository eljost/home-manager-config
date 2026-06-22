{
  pkgs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    shortcut = "a";

    extraConfig = ''
      #unbind C-b
      #set -g prefix C-a
      #bind C-a send-prefix

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind h previous-window
      bind l next-window

      set -g history-limit 102400
      set -g renumber-windows on

      bind c new-window -c "#{pane_current_path}" \; command-prompt -p "Name:" "rename-window '%%'"
      bind r source-file ~/.tmux.conf \; display-message "Reloaded config from .tmux.conf!"

      set -g mouse on
      set -as terminal-overrides ",xterm-256color:Tc"

      # Enable clipboard access in opencode
      set -g allow-passthrough on
      set -g set-clipboard on
    '';
  };
}

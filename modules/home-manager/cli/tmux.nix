{ config, pkgs, ... }:

{
    programs.tmux = {
        enable = true;
        prefix = "C-space";
        mouse = true;
        baseIndex = 1;
        newSession = true;
        keyMode = "vi";

        plugins = with pkgs; [
            tmuxPlugins.yank
            tmuxPlugins.vim-tmux-navigator
            tmuxPlugins.sensible
            tmuxPlugins.gruvbox
        ];

        extraConfig = ''
            # adds colors
            set-option -sa terminal-overrides ",xterm*:Tc"
            # set vi mode
            set-window-option -g mode-keys vi
            # shift alt vim keys to switch windows
            bind -n M-H previous-window
            bind -n M-L next-window
            bind-key -T copy-mode-vi v send-keys -X begin-selection
            bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
            bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

            # open new panes in cwd
            bind '"' split-window -v -c "#{plane-current-path}"
            bind % split-window -h -c "#{plane-current-path}"
        '';
    };
}

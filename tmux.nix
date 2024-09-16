{ pkgs, ... }:

{
  enable = true;

  extraConfig = ''
    set-option -g mouse on
    set-option -s set-clipboard off
    bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -i"
  '';
}

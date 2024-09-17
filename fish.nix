{ pkgs, ... }:

let
  secrets =
    if builtins.pathExists "/home/morgan/.config/home-manager/secrets.nix"
    then import /home/morgan/.config/home-manager/secrets.nix
    else { };
  tmuxFishConfig = '' 
    if not set -q TMUX
      set -g TMUX tmux new-session -d -s base
      eval $TMUX
      tmux attach-session -d -t base
    end
  '';
in
{
  enable = true;

  shellInit = ''
    mkdir -p ~/.config/fish/conf.d
    echo "${tmuxFishConfig}" > ~/.config/fish/conf.d/tmux.fish
  '';

  interactiveShellInit = ''
    # Remove greeting message
    set --export fish_greeting

    # User configuration
    set --export LANG fr_FR.UTF-8
    set --export EDITOR vim

    # local bin
    set --export PATH $PATH ~/.local/bin

    # Node.js
    set --export NODE_OPTIONS "--max-old-space-size=4096"

    # Chrome
    set --export CHROME_BIN /usr/bin/chromium
    set --export CHROME_EXECUTABLE /usr/bin/chromium

    # flutter
    set --export PATH $PATH ~/Logiciels/flutter/bin
    # Android
    set --export ANDROID_HOME $HOME/Android/Sdk
    set --export PATH $PATH $ANDROID_HOME/tools/bin/ $ANDROID_HOME/emulator/
    
    # Mvx
    set --export PATH $PATH $HOME/multiversx-sdk

    # Krew
    set --export PATH $PATH $HOME/.krew/bin
    # loki
    set --export LOKI_ADDR ${secrets.LOKI_ADDR}
    set --export LOKI_USERNAME ${secrets.LOKI_USERNAME}
    set --export LOKI_PASSWORD ${secrets.LOKI_PASSWORD}
    # Jenkins
    set --export JENKINS_URL ${secrets.JENKINS_URL}
    set --export JENKINS_USER_ID ${secrets.JENKINS_USER_ID}
    set --export JENKINS_API_TOKEN ${secrets.JENKINS_API_TOKEN}
  '';

  shellAliases = {
    ll = "ls -l";
    la = "ls -A";
    l = "ls -CF";

    prettyjson = "python -mjson.tool";

    gs = "git status -sb ";
    gl = "git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    ga = "git add ";
    gb = "git branch ";
    gc = "git commit";
    gd = "git diff";
    gco = "git checkout ";
    gk = "gitk --all&";
    gx = "gitx --all";
    gpl = "git pull --ff-only";
    gpu = "git push";
    gt = "git stash";
    got = "git ";
    get = "git ";
    gdt = "git difftool";

    upgrade = "sudo apt update && sudo apt dist-upgrade";

    tm = "ps -ef | grep";

    ".." = "cd ..";
    "..." = "cd ../../";
    "...." = "cd ../../../";
    "....." = "cd ../../../../";
    "......" = "cd ../../../../../";

    c = "clear";

    # aliases for Tmux
    ta = "tmux attach -t";
    tn = "tmux new -s";
    tl = "tmux ls";
    tk = "tmux kill-session -t";

    peek = "peek -b ffmpeg";

    # code = "code-insiders";

  };
}


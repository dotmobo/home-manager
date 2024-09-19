{ pkgs, ... }:

{
  enable = true;

  interactiveShellInit = ''
    # Remove greeting message
    set --export fish_greeting

    # Atuin
    set --export ATUIN_SESSION (atuin uuid)

    # Starship
    starship init fish | source

    # Zellij
    if set -q ZELLIJ
    else
      zellij
    end
  '';

  shellAliases = {
    ls = "eza";
    ll = "ls -l";
    la = "ls -A";

    find = "fd";

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


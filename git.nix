{ pkgs, ... }:

{
  enable = true;
  userName = "mobo";
  userEmail = "morgan.bohn@pc-scol.fr";
  extraConfig = {
    push = {
      default = "current";
      autoSetupRemote = true;
    };
    credential = {
      "https://github.com" = {
        helper = "!gh auth git-credential";
      };
    };
  };
  aliases = {
    url = "config --get remote.origin.url";
    status-short = "status -sb";
    review = "add -p";
    log-short = "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    revert-merge = "revert -m 1 --no-commit";
    reset-last-commit = "reset --hard HEAD~1";
    changelog = "log --no-merges --pretty=format:'* %s' --reverse";
  };
}

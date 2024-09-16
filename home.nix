{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "morgan";
  home.homeDirectory = "/home/morgan";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    git
  ];

  home.file = { };

  home.sessionVariables = { };

  programs = {
    git = (import ./git.nix { inherit pkgs; });
  };

}

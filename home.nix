{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "morgan";
  home.homeDirectory = "/home/morgan";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  home.file = { };

  home.sessionVariables = { };

  programs = {
    git = (import ./git.nix { inherit pkgs; });
    tmux = (import ./tmux.nix { inherit pkgs; });
    neovim = (import ./neovim.nix { inherit pkgs; });
  };

  fonts.fontconfig.enable = true;

}

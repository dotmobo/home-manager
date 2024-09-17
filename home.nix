{ config, pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.home-manager.enable = true;

  home.username = "morgan";
  home.homeDirectory = "/home/morgan";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    # Fonts
    fira-code
    fira-code-symbols
    # Terminal
    guake
    # Programming languages
    nodejs_20
    go
    python312
    poetry
    ruff
    black
    pyright
    rustc
    rustfmt
    cargo
    rust-analyzer
    clippy
    zig
    lua
    # Tools
    httpie
    wget
    jq
    curl
    ffmpeg
    htop
    xclip
    bats
  ];

  home.file = { };

  home.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };

  programs = {
    git = (import ./git.nix { inherit pkgs; });
    tmux = (import ./tmux.nix { inherit pkgs; });
    neovim = (import ./neovim.nix { inherit pkgs; });
    fish = (import ./fish.nix { inherit pkgs; });
    vscode = (import ./vscode.nix { inherit pkgs; });
  };

  fonts.fontconfig.enable = true;

}

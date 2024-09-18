{ config, pkgs, ... }:

let
  secrets =
    if builtins.pathExists "/home/morgan/.config/home-manager/secrets.nix"
    then import /home/morgan/.config/home-manager/secrets.nix
    else { };  
in
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
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
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
    ripgrep
    tmux
    eza
    fd
    tree
    peek
    # Prompt
    atuin
    starship
    zellij
  ];

  home.file = { };

  home.sessionVariables = {
    # User configuration
    EDITOR = "nvim";
    LANG = "fr_FR.UTF-8";
    # Chrome
    CHROME_BIN = "/usr/bin/chromium";
    CHROME_EXECUTABLE = "/usr/bin/chromium";
    # Node.js
    NODE_OPTIONS = "--max-old-space-size=4096";
    # Rust
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    # loki
    LOKI_ADDR = "${secrets.LOKI_ADDR}";
    LOKI_USERNAME = "${secrets.LOKI_USERNAME}";
    LOKI_PASSWORD = "${secrets.LOKI_PASSWORD}";
    # Jenkins
    JENKINS_URL = "${secrets.JENKINS_URL}";
    JENKINS_USER_ID = "${secrets.JENKINS_USER_ID}";
    JENKINS_API_TOKEN = "${secrets.JENKINS_API_TOKEN}";
    # Android
    ANDROID_HOME = "/home/morgan/Android/Sdk";
  };

  home.sessionPath = [ 
    "$HOME/.local/bin" 
    "$HOME/.krew/bin"
    "$HOME/multiversx-sdk"
    "$ANDROID_HOME/tools/bin/"
    "$ANDROID_HOME/emulator/"
    "$HOME/Logiciels/flutter/bin"
    ];

  programs = {
    git = (import ./git.nix { inherit pkgs; });
    neovim = (import ./neovim.nix { inherit pkgs; });
    fish = (import ./fish.nix { inherit pkgs; });
    vscode = (import ./vscode.nix { inherit pkgs; });
    zoxide = {
      enable = true;
      enableFishIntegration= true;
      options = [
        "--cmd cd"
      ];
    };
  };

  fonts.fontconfig.enable = true;

}

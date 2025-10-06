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

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    devenv
    # Fonts
    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
    # Terminal
    guake
    tdrop
    wmctrl
    alacritty # need nixGL
    st
    atuin
    starship
    gum
    # Programming languages
    gcc
    zlib
    nodejs_22
    pnpm
    bun
    deno
    go
    python3
    pipx
    poetry
    uv
    ruff
    black
    pyright
    ansible
    ansible-lint
    portaudio
    sshpass
    rustc
    rustfmt
    cargo
    rust-analyzer
    clippy
    zig
    lua
    nim
    odin
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
    bat
    fd
    tree
    peek
    rsync
    gh
    zip
    unzip
    unrar
    transmission
    chromium
    # Network
    traceroute
    tcpdump
    # llm
    llama-cpp
    # kube
    openshift
    kubernetes-helm
    argocd
    s3cmd
    rclone
    podman
    skopeo
    pandoc
    texliveTeTeX
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
    # Libs
    LD_LIBRARY_PATH = "${pkgs.zlib}/lib:${pkgs.portaudio}/lib:${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH";
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
    zellij = {
      enable = true;
      settings = {
        copy_command = "xclip -selection clipboard";
        paste_command = "xclip -selection clipboard -o";
        show_startup_tips = false;
      };
    };
  };

  fonts.fontconfig.enable = true;

}

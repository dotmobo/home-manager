{ pkgs, ... }:

let
  unstablePkgs = import <nixpkgs> {
    system = builtins.currentSystem;
  };
in
{
  enable = true;

  userSettings = {
    workbench.colorTheme = "Dracula Theme";
    workbench.startupEditor = "none";
    editor.fontSize = 14;
    editor.fontFamily = "Fira Code";
    editor.fontLigatures = true;
    editor.rulers = [
      { column = 120; color = "#7d4a4a"; }
    ];
    editor.insertSpaces = true;
    editor.tabSize = 4;
    window.zoomLevel = 1.25;
    explorer.confirmDelete = false;
    "[typescript]".editor.defaultFormatter = "esbenp.prettier-vscode";
    "[html]".editor.defaultFormatter = "vscode.html-language-features";
    extensions.ignoreRecommendations = true;
    "[python]".editor.defaultFormatter = "charliermarsh.ruff";
  };

  extensions = with pkgs.vscode-extensions; [
    dracula-theme.theme-dracula
    jnoortheen.nix-ide
    angular.ng-template
    # cyrilletuzi.angular-schematics
    ms-python.python
    ms-python.vscode-pylance
    ms-python.debugpy
    ms-python.black-formatter
    charliermarsh.ruff
    esbenp.prettier-vscode
    dbaeumer.vscode-eslint
    ms-azuretools.vscode-docker
    eamodio.gitlens
    pkief.material-icon-theme
    github.copilot
    redhat.vscode-yaml
    github.copilot-chat
    christian-kohler.path-intellisense
    christian-kohler.npm-intellisense
    golang.go
    bradlc.vscode-tailwindcss
    rust-lang.rust-analyzer
    vadimcn.vscode-lldb
    tamasfe.even-better-toml
    redhat.ansible
    ipierre1.ansible-vault-vscode
    # Utilisation de nix-unstable pour certaines extensions
    (unstablePkgs.vscode-extensions.jetmartin.bats)
    (unstablePkgs.vscode-extensions.pollywoggames.pico8-ls)
  ];
}

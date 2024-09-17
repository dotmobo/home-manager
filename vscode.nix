{ pkgs, ... }:

{
  enable = true;

  userSettings = {
    workbench.colorTheme = "Dracula";
    workbench.startupEditor = "none";
    editor.fontSize = 14;
    editor.fontFamily = "Fira Code";
    editor.fontLigatures = true;
    window.zoomLevel = 1.25;
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
    ms-pyright.pyright
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
    # elrond.vscode-elrond-ide
    # jetmartin.bats
  ];
}

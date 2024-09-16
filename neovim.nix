{ pkgs, ... }:

{
  enable = true;

  plugins = with pkgs.vimPlugins; [
    ctrlp-vim
  ];
}

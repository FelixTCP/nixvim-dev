# Packages installed specifically for the user 'felix'
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono

    ripgrep
    fd
    fzf
    delta
    ncurses
  ];
}

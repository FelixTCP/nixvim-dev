{ ... }:

{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true; # Handles init and alias ('z')
    options = [ "--cmd cd" ]; # Ensures it uses cd for zsh
  };
}

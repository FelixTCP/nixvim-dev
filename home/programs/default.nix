# Import all program configurations
{ ... }:

{
  imports = [
    ./atuin.nix
    ./bat.nix
    ./btop.nix
    ./bun.nix
    ./eza.nix
    ./git.nix
    ./nixvim/default.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}


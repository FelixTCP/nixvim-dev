{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    nixpkgs.config.allowUnfree = true;

    extraPackages = with pkgs; [ ripgrep fd ];

    imports = [ ./config.nix ./keymaps.nix ./plugins.nix ];
  };
}


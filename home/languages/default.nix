# Import all language configurations
{ pkgs, ... }: {
  imports = [ ./lua.nix ./nix.nix ./python.nix ./typescript.nix ./java.nix ];
}


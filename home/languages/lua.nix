{ pkgs, ... }: {
  home.packages = with pkgs; [
    lua

    # Formatters / Linters
    stylua
  ];
}

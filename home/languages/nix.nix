{ pkgs, ... }: {
  home.packages = with pkgs;
    [

      # Formatters / Linters
      statix
    ];
}

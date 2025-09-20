{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs

    # Linters / Formatters
    prettier
  ];
}

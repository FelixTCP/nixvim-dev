{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Java SDK
    zulu

    # Build Tools
    maven

    # Linters / Formatters
    google-java-format
    checkstyle

    # Other
    lombok
  ];
}

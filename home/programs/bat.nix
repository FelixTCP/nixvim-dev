{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = { theme = "Catppuccin Mocha"; };
    # TODO: evaluation warning: felix profile: Using programs.bat.themes as a string option is deprecated and will be
    #               removed in the future. Please change to using it as an attribute set
    #               instead.
    themes = {
      Catppuccin-mocha = builtins.readFile (pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "bat";
        rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
        sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
      } + "/Catppuccin-mocha.tmTheme");
    };
  };
}

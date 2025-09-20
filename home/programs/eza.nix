{ ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true; # Manages aliases and completions
    git = true;
    icons = "auto";
    extraOptions = [
      "--color=always"
      "--group-directories-first"
      "--long"
      "--no-filesize"
      "--no-time"
      "--no-user"
      "--no-permissions"
      # Tree specific defaults can be added if needed, but usually specified in alias
    ];
  };
}

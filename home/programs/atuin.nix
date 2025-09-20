# Atuin configuration
{ ... }:

{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    # Add settings here if needed
    settings = {
      # sync_address = "https://your-atuin-server.com";
      # auto_sync = true;
    };
  };
}

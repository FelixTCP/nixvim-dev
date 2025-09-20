{ ... }: {
  programs.bun = {
    enable = true;
    enableGitIntegration = true;
    settings = {
      telemetry = false;
      test = { coverage = true; };
    };
  };
}


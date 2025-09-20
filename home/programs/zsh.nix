{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.home.homeDirectory}/.config/zsh";
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    shellAliases = {
      cl = "clear";
      nv = "nvim";
      # Use the actual host name from flake.nix if different from 'defaultNixos'
      nix-rebuild-l =
        "sudo nixos-rebuild switch --flake ~/.config/nixos/#laptop";
      nix-rebuild =
        "sudo nixos-rebuild switch --flake ~/.config/nixos/#defaultNixos";
      nix-on-rebuild = "~/.config/nixos/push_on_update.sh";
      nix-update = "nix-rebuild && nix-on-rebuild";
      hm-switch =
        "home-manager switch --flake ~/.config/nixos/#felix@defaultNixos";
      # Prefer options integrated with eza module if available
      ls = "eza"; # Base command, rely on eza module for flags
      ll = "eza -l";
      lt = "eza -T --level=3";
      git-loc = "git ls-files | xargs wc -l";
    };
    initContent = ''
      # Set proper locale
      export LANG=en_US.UTF-8
      export LC_ALL=en_US.UTF-8

      # Enable correction
      setopt CORRECT
      setopt CORRECT_ALL

      # Set maximum number of corrections to ask about
      SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color? (Y/N/E/A) "

      # Set correction prompt style
      zstyle ':completion:*' completer _complete _match _approximate
      zstyle ':completion:*:match:*' original only
      zstyle ':completion:*:approximate:*' max-errors 1 numeric

      # Ignore specific commands for correction
      alias mv='nocorrect mv'
      alias cp='nocorrect cp'
      alias mkdir='nocorrect mkdir'

      # Set the prompt
      export PROMPT='%F{blue}%n%f | %F{white}%~%f> '
      export TERM="xterm-256color"
      export PATH=$PATH:$HOME/.cargo/bin
      # export PATH=$PATH:$HOME/.bun/bin

      # Git ssh-agent logic
      env=~/.ssh/agent.env
      agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
      agent_start () {
              (umask 077; ssh-agent >| "$env")
              . "$env" >| /dev/null ; }
      agent_load_env
      agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
      if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
              agent_start
              ssh-add -q # Use -q for quiet add
      elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
              ssh-add -q # Use -q for quiet add
      fi
      unset env

      # Plugin integrations are handled by their respective modules (zoxide, atuin, eza)
    '';
    # Zsh plugin configurations are handled by other modules below
  };
}


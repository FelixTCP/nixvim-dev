# Git configuration
{ pkgs, ... }:

{
  programs.git = {
    # enable = true;

    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
        line-numbers = true;
        plus-style = "syntax #003800";
        minus-style = "syntax #3f0001";
        commit-decoration-style = "bold yellow box ul";
        file-style = "bold yellow ul";
        file-decoration-style = "none";
        hunk-header-decoration-style = "cyan box ul";
        hunk-header-file-style = "red";
        hunk-header-line-number-style = "#067a00";
        hunk-header-style = "file line-number syntax";
        file-added-label = "[+]";
        file-copied-label = "[==]";
        file-modified-label = "[*]";
        file-removed-label = "[-]";
        file-renamed-label = "[->]";
        line-numbers-left-style = "cyan";
        line-numbers-right-style = "cyan";
        line-numbers-minus-style = "red";
        line-numbers-plus-style = "green";
        merge-conflict-begin-symbol = "▼";
        merge-conflict-end-symbol = "▲";
        merge-conflict-ours-diff-header-style = "yellow bold";
        merge-conflict-theirs-diff-header-style = "yellow bold italic";
        whitespace-error-style = "reverse red";
        zero-style = "syntax";
      };
    };
  };
}


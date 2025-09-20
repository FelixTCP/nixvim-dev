# NixVim Plugin Configurations
{ pkgs, ... }:

{
  config.plugins = {
    lualine.enable = true; # Status line
    oil.enable = true; # File explorer
    undotree = { # Undo history visualization
      enable = true;
      settings = {
        WindowLayout = 2; # Simpler layout
        RelativeTimestamp = true;
      };
    };
    comment.enable = true; # Easy commenting (`gc`, `gcc`)
    trouble.enable = true; # Better diagnostics/quickfix list
    todo-comments.enable = true; # Highlight TODO, FIXME, etc.
    which-key = {
      enable = true;
      settings = {
        replace = {
          desc = [
            [ "<space>" "SPACE" ]
            [ "<leader>" "SPACE" ]
            [ "<[cC][rR]>" "RETURN" ]
            [ "<[tT][aA][bB]>" "TAB" ]
            [ "<[bB][sS]>" "BACKSPACE" ]
          ];
        };
        spec = [
          {
            __unkeyed-1 = "<leader>s";
            group = "Search";
          }
          {
            __unkeyed-1 = "<leader>w";
            group = "Workspace";
          }
          {
            __unkeyed-1 = "<leader>c";
            group = "Code";
          }
          {
            __unkeyed-1 = "<leader>g";
            group = "Git";
          }
          {
            __unkeyed-1 = "<leader>m";
            group = "Markdown";
          }
          {
            __unkeyed-1 = "<leader>h";
            group = "Harpoon";
          }
        ];
      };
    };
    notify = { # Better notifications
      enable = true;
      settings = { fps = 60; };
    };
    mini = { # Collection of small useful plugins
      enable = true;
      modules = {
        ai = { }; # Enhanced text objects (a/i for args, etc.)
        surround = { }; # Add/change/delete surroundings
        # indentscope = { }; # Visualize indent levels (alternative to indent-blankline)
      };
    };

    # Completion
    cmp = {
      enable = true;
      settings = {
        snippet.expand = "luasnip";
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })"; # Confirm selection
        };
        # Add formatting for nice icons (requires web-devicons)
        formatting.fields = [ "kind" "abbr" "menu" ];
      };
    };
    luasnip.enable = true; # Snippet engine
    lspkind = { # Icons for completion and LSP
      enable = true;
      settings = {
        mode = "symbol_text";
        preset = "codicons"; # Or 'default', 'material'
      };
    };

    # LSP Servers / Formatting / Linting
    # LSP servers defined within the lsp plugin block for better organization
    lsp.servers = {
      clangd.enable = true;
      nil_ls.enable = true; # Nix LSP
      pyright.enable = true; # Python LSP
      jdtls.enable = true; # Java LSP

      # Web development LSPs
      html.enable = true;
      cssls.enable = true;
      ts_ls.enable = true; # For both JS and TS
      angularls.enable = true; # Angular LSP
      jsonls.enable = true; # JSON LSP
      yamlls.enable = true; # YAML LSP
    };

    # Formatters defined within conform-nvim
    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
        notify_on_error = true;
        format_options = { stop_after_first = true; };
        formatters_by_ft = {
          html = [ "prettierd" "prettier" ];
          css = [ "prettierd" "prettier" ];
          javascript = [ "prettierd" "prettier" ];
          typescript = [ "prettierd" "prettier" ];
          javascriptreact = [ "prettierd" "prettier" ];
          typescriptreact = [ "prettierd" "prettier" ];
          json = [ "prettierd" "prettier" ];
          yaml = [ "prettierd" "prettier" ];
          markdown = [ "prettierd" "prettier" ];
          python = [ "black" ];
          java = [ "google-java-format" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt" ]; # Use nixfmt-classic instead of nixfmt
          #"*" = [ "codespell" ]; # Apply codespell to all filetypes
        };
      };
    };

    # Linters defined within lint plugin
    lint.lintersByFt = {
      json = [ "jsonlint" ];
      nix = [ "statix" ];
      java = [ "checkstyle" ];
      # Add other linters, e.g., shellcheck for shell scripts
      # sh = [ "shellcheck" ];
    };

    # Git Integration
    fugitive.enable = true; # Core Git commands (:Git)
    gitsigns = { # Git decorations in the sign column
      enable = true;
      settings = {
        current_line_blame = true;
        current_line_blame_opts.virt_text = true;
        current_line_blame_opts.virt_text_pos = "eol";
        signcolumn = true; # Use sign column for git markers
        numhl = true; # Highlight line numbers with git status
        word_diff = false;
        signs = { # Catppuccin-themed signs
          add = { text = "┃"; };
          change = { text = "┃"; };
          delete = { text = "_"; };
          topdelete = { text = "‾"; };
          changedelete = { text = "~"; };
          untracked = { text = "┆"; };
        };
      };
    };
    diffview = {
      enable = true;
      diffBinaries = false;
      enhancedDiffHl = true;
      useIcons = true;
    };

    # Language Specific
    treesitter = { # Better syntax highlighting and code analysis
      enable = true;
      # Ensure parsers are installed, add more as needed
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        c
        cpp
        python
        lua
        nix
        json
        yaml
        html
        css
        javascript
        typescript
        tsx
        bash
        markdown
        markdown_inline
      ];
      settings = {
        highlight.enable = true;
        indent.enable = true; # Enable indentation
        incrementalSelection.enable = true; # Enable incremental selection
        rainbow.enable = false; # Enable rainbow parentheses
        contextCommentstring.enable =
          true; # Enable context-aware comment strings
        autotag.enable = true; # Enable auto-tagging for HTML/XML
      };
    };
    markdown-preview = { # Markdown preview in browser
      enable = true;
      settings.autoStart = false; # Don't auto-start on opening markdown
    };

    # Telescope and extensions
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true; # Faster searching
        ui-select.enable = true; # Use telescope for vim.ui.select
        # Add other extensions like telescope-live-grep-args if needed
      };
    };

    # Navigation / Editing Enhancements
    harpoon = { # Quick file navigation/marking
      enable = true;
      enableTelescope = true; # Integrate with Telescope
    };

    tmux-navigator = { # Seamless navigation between vim and tmux panes
      enable = true;
    };

    # Copilot (requires separate account/setup)
    copilot-vim.enable = true; # Enable if you use GitHub Copilot
  };
}


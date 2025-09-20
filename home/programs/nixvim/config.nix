# NixVim Core Configuration (Options, Globals, Base Settings)
{ ... }: {
  config = {
    # Colorscheme
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        term_colors = true;
        transparent_background = true;
        integrations = {
          cmp = true;
          gitsigns = true;
          nvimtree = true;
          treesitter = true;
          notify = true;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
          telescope = true;
          native_lsp = { enabled = true; };
          lsp_trouble = true;
          headlines = true;
          markdown = true;
        };
      };
    };

    # Global settings
    globals.mapleader = " ";
    globals.have_nerd_font = true;

    # Core Neovim options
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      clipboard = "unnamedplus";
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      inccommand = "split";
      scrolloff = 10;
      hlsearch = true;
      shiftwidth = 2;
      expandtab = true;
      cursorline = true;
      termguicolors = true;
    };

    plugins.lsp = {
      enable = true;
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "[G]oto [D]definition";
          };
          gr = {
            action = "references";
            desc = "[G]oto [R]eferences";
          };
          gD = {
            action = "declaration";
            desc = "[G]oto [D]eclaration";
          };
          gI = {
            action = "implementation";
            desc = "[G]oto [I]mplementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type [D]definition";
          };
          K = {
            action = "hover";
            desc = "Hover Documentation";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "[C]ode [A]ction";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "[R]ename";
          };
          "<leader>cs" = {
            action = "signature_help";
            desc = "[S]ignature Help";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "]d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "[d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };

    plugins = {
      lint.enable = true;
      web-devicons.enable = true;
      lsp-lines.enable = true;
    };
  };
}

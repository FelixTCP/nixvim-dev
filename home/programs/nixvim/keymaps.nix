# NixVim Keymap Definitions
{ ... }:

{
  config.keymaps = [
    # General Utility Keymaps
    {
      key = "-";
      mode = "n";
      action = "<cmd>:Oil<CR>";
      options = { desc = "Open parent directory (Oil)"; };
    }
    {
      key = "<F5>";
      mode = [ "n" "i" "v" ];
      action = "<cmd>:UndotreeToggle<CR>";
      options = { desc = "Toggle Undotree"; };
    }

    # Telescope Keymaps
    {
      key = "<leader>sf";
      mode = "n";
      action = "<cmd>Telescope find_files<CR>";
      options = { desc = "[S]earch [F]iles"; };
    }
    {
      key = "<leader>sg";
      mode = "n";
      action = "<cmd>Telescope live_grep<CR>";
      options = { desc = "[S]earch by [G]rep"; };
    }
    {
      key = "<leader>sw";
      mode = "n";
      action = "<cmd>Telescope grep_string<CR>";
      options = { desc = "[S]earch current [W]ord"; };
    }
    {
      key = "<leader>sb";
      mode = "n";
      action = "<cmd>Telescope buffers<CR>";
      options = { desc = "[S]earch [B]buffers"; };
    }
    {
      key = "<leader>sd";
      mode = "n";
      action = "<cmd>Telescope diagnostics<CR>";
      options = { desc = "[S]earch [D]iagnostics"; };
    }
    {
      key = "<leader>s.";
      mode = "n";
      action = "<cmd>Telescope oldfiles<CR>";
      options = { desc = "[S]earch Recent Files (.)"; };
    }
    {
      key = "<leader>sh";
      mode = "n";
      action = "<cmd>Telescope harpoon marks<CR>";
      options = { desc = "[S]earch [H]arpoon Marks"; };
    }
    {
      key = "<leader>sk";
      mode = "n";
      action = "<cmd>Telescope keymaps<CR>";
      options = { desc = "[S]earch [K]eymaps"; };
    }
    {
      key = "<leader>sc";
      mode = "n";
      action = "<cmd>Telescope git_commits<CR>";
      options = { desc = "[S]earch Git [C]omits"; };
    }
    {
      key = "<leader>sB";
      mode = "n";
      action = "<cmd>Telescope git_branches<CR>";
      options = { desc = "[S]earch Git [B]ranches"; };
    }
    {
      key = "<leader>sS";
      mode = "n";
      action = "<cmd>Telescope git_status<CR>";
      options = { desc = "[S]earch Git [S]tatus"; };
    }
    # LSP Workspace Symbols search (if Telescope LSP is configured)
    {
      key = "<leader>cw";
      mode = "n";
      action = "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>";
      options = { desc = "[C]ode [W]orkspace Symbols"; };
    }

    # Git / Gitsigns / Diffview Keymaps
    {
      key = "[c";
      mode = "n";
      action = "<cmd>:Gitsigns prev_hunk<CR>";
      options = { desc = "Previous Hunk"; };
    }
    {
      key = "]c";
      mode = "n";
      action = "<cmd>:Gitsigns next_hunk<CR>";
      options = { desc = "Next Hunk"; };
    }
    {
      key = "<leader>gp";
      mode = "n";
      action = "<cmd>:Gitsigns preview_hunk<CR>";
      options = { desc = "[P]review Hunk"; };
    }
    {
      key = "<leader>gr";
      mode = "n";
      action = "<cmd>:Gitsigns reset_hunk<CR>";
      options = { desc = "[R]eset Hunk"; };
    }
    {
      key = "<leader>gs";
      mode = "n";
      action = "<cmd>:Gitsigns stage_hunk<CR>";
      options = { desc = "[S]tage Hunk"; };
    }
    {
      key = "<leader>gu";
      mode = "n";
      action = "<cmd>:Gitsigns undo_stage_hunk<CR>";
      options = { desc = "[U]ndo Stage Hunk"; };
    }
    {
      key = "<leader>gb";
      mode = "n";
      action = "<cmd>:Gitsigns toggle_current_line_blame<CR>";
      options = { desc = "Toggle Line [B]lame"; };
    }
    {
      key = "<leader>gd";
      mode = "n";
      action = "<cmd>:DiffviewOpen<CR>";
      options = { desc = "[D]iff View"; };
    }
    {
      key = "<leader>gq";
      mode = "n";
      action = "<cmd>:DiffviewClose<CR>";
      options = { desc = "Diff View [Q]uit"; };
    }
    {
      key = "<leader>gh";
      mode = "n";
      action = "<cmd>:DiffviewFileHistory %<CR>";
      options = { desc = "File [H]istory"; };
    }
    {
      key = "<leader>gm";
      mode = "n";
      action = "<cmd>:DiffviewOpen --merge<CR>";
      options = { desc = "[M]erge Tool"; };
    }

    # Markdown Keymaps
    {
      key = "<leader>mp";
      mode = "n";
      action = "<cmd>:MarkdownPreviewToggle<CR>";
      options = { desc = "Toggle [P]review"; };
    }

    # Harpoon Keymaps
    {
      key = "<leader>ha";
      mode = "n";
      action = ''<Cmd>lua require("harpoon"):list():add()<CR>'';
      options = { desc = "[A]dd Mark"; };
    }
    {
      key = "<leader>hx";
      mode = "n";
      action = ''<Cmd>lua require("harpoon"):list():remove()<CR>'';
      options = { desc = "Remove Mark"; };
    }
    {
      key = "<leader>hq";
      mode = "n";
      action = ''<Cmd>lua require("harpoon"):list():clear()<CR>'';
      options = { desc = "[C]lear All Marks"; };
    }
    {
      key = "<leader>hh";
      mode = "n";
      action = ''
        <Cmd>lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>'';
      options = { desc = "Toggle Quick Menu"; };
    }
    {
      key = "<leader>hn";
      mode = "n";
      action = ''<Cmd>lua require("harpoon"):list():next()<CR>'';
      options = { desc = "[N]ext Mark"; };
    }
    {
      key = "<leader>hp";
      mode = "n";
      action = ''<Cmd>lua require("harpoon"):list():prev()<CR>'';
      options = { desc = "[P]revious Mark"; };
    }
    # Direct navigation (adjust keys if needed)
    {
      key = "<leader>hs";
      mode = "n";
      action = ''<Cmd>lua require("harpoon"):list():select(1)<CR>'';
      options = { desc = "Go to Mark [1]"; };
    }
    {
      key = "<leader>hd";
      mode = "n";
      action = ''<Cmd>lua require("harpoon"):list():select(2)<CR>'';
      options = { desc = "Go to Mark [2]"; };
    }
    {
      key = "<leader>hf";
      mode = "n";
      action = ''<Cmd>lua require("harpoon"):list():select(3)<CR>'';
      options = { desc = "Go to Mark [3]"; };
    }
    {
      key = "<leader>hg";
      mode = "n";
      action = ''<Cmd>lua require("harpoon"):list():select(4)<CR>'';
      options = { desc = "Go to Mark [4]"; };
    }
  ];
}


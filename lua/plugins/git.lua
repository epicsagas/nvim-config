return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "Next hunk" })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "Previous hunk" })

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
          map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
          map("v", "<leader>hs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "Stage hunk" })
          map("v", "<leader>hr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "Reset hunk" })
          map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
          map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
          map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
          map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
          map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
          end, { desc = "Blame line" })
          map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle blame line" })
          map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
          map("n", "<leader>hD", function()
            gs.diffthis("~")
          end, { desc = "Diff this ~" })
          map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
        end,
      })
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- LazyGit keybindings
      vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
      vim.keymap.set("n", "<leader>gc", "<cmd>LazyGitConfig<CR>", { desc = "LazyGit Config" })
      vim.keymap.set("n", "<leader>gf", "<cmd>LazyGitFilter<CR>", { desc = "LazyGit Filter" })
      vim.keymap.set("n", "<leader>gF", "<cmd>LazyGitFilterCurrentFile<CR>", { desc = "LazyGit Current File" })
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({
        integrations = {
          diffview = true,
          telescope = true,
        },
      })

      -- Neogit keybindings
      vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { desc = "Neogit Status" })
      vim.keymap.set("n", "<leader>gC", "<cmd>Neogit commit<CR>", { desc = "Neogit Commit" })
      vim.keymap.set("n", "<leader>gp", "<cmd>Neogit push<CR>", { desc = "Neogit Push" })
      vim.keymap.set("n", "<leader>gP", "<cmd>Neogit pull<CR>", { desc = "Neogit Pull" })
      vim.keymap.set("n", "<leader>gl", "<cmd>Neogit log<CR>", { desc = "Neogit Log" })
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
      })

      -- Diffview keybindings
      vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview Open" })
      vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Diffview Close" })
      vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "Diffview File History" })
      vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview Current File History" })
    end,
  },
}

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            -- Rust-specific keymaps
            vim.keymap.set("n", "<leader>ca", function()
              vim.cmd.RustLsp("codeAction")
            end, { desc = "Code Action", buffer = bufnr })
            vim.keymap.set("n", "<leader>dr", function()
              vim.cmd.RustLsp("debuggables")
            end, { desc = "Rust Debuggables", buffer = bufnr })
            vim.keymap.set("n", "<leader>rr", function()
              vim.cmd.RustLsp("runnables")
            end, { desc = "Rust Runnables", buffer = bufnr })
            vim.keymap.set("n", "<leader>rt", function()
              vim.cmd.RustLsp("testables")
            end, { desc = "Rust Testables", buffer = bufnr })
            vim.keymap.set("n", "<leader>re", function()
              vim.cmd.RustLsp("expandMacro")
            end, { desc = "Expand Macro", buffer = bufnr })
            vim.keymap.set("n", "<leader>rc", function()
              vim.cmd.RustLsp("openCargo")
            end, { desc = "Open Cargo.toml", buffer = bufnr })
            vim.keymap.set("n", "<leader>rp", function()
              vim.cmd.RustLsp("parentModule")
            end, { desc = "Parent Module", buffer = bufnr })
            vim.keymap.set("n", "<leader>rh", function()
              vim.cmd.RustLsp({ "hover", "actions" })
            end, { desc = "Hover Actions", buffer = bufnr })
          end,
        },
      }
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup({
        popup = {
          autofocus = true,
        },
      })

      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          local cmp = require("cmp")
          cmp.setup.buffer({ sources = { { name = "crates" } } })
        end,
      })
    end,
  },
}

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
        },
      })

      -- Terminal keymaps
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

      -- Quick run commands
      local Terminal = require("toggleterm.terminal").Terminal

      -- Rust runner
      local rust_run = Terminal:new({
        cmd = "cargo run",
        hidden = true,
        direction = "float",
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
      })

      function _RUST_RUN()
        rust_run:toggle()
      end

      -- Go runner
      local go_run = Terminal:new({
        cmd = "go run .",
        hidden = true,
        direction = "float",
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
      })

      function _GO_RUN()
        go_run:toggle()
      end

      -- Rust test runner (current file)
      local rust_test = Terminal:new({
        cmd = function()
          return "cargo test"
        end,
        hidden = true,
        direction = "float",
      })

      function _RUST_TEST()
        rust_test:toggle()
      end

      -- Go test runner
      local go_test = Terminal:new({
        cmd = function()
          local file = vim.fn.expand("%")
          return "go test -v " .. vim.fn.fnamemodify(file, ":h")
        end,
        hidden = true,
        direction = "float",
      })

      function _GO_TEST()
        go_test:toggle()
      end

      -- General keymaps
      vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal Float" })
      vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal Horizontal" })
      vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal Vertical" })
    end,
  },
}

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- Optional for slash commands
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          -- Chat strategy (primary AI interaction)
          chat = {
            adapter = "anthropic", -- Default to Claude
            keymaps = {
              send = {
                modes = {
                  n = "<CR>",
                  i = "<C-s>",
                },
              },
            },
          },
          -- Inline strategy (code suggestions)
          inline = {
            adapter = "anthropic",
          },
          -- Agent strategy (using CLI agents)
          agent = {
            adapter = "claude_code", -- For Claude Code CLI
          },
        },

        -- Configure adapters for multiple AI providers (v18.0.0+ structure)
        adapters = {
          http = {
            -- Anthropic Claude
            anthropic = function()
              return require("codecompanion.adapters").extend("anthropic", {
                env = {
                  api_key = "ANTHROPIC_API_KEY",
                },
                schema = {
                  model = {
                    default = "claude-sonnet-4-20250514",
                    choices = {
                      "claude-opus-4-20250514",
                      "claude-sonnet-4-20250514",
                      "claude-3-7-sonnet-20250219",
                      "claude-3-5-sonnet-20241022",
                    },
                  },
                },
              })
            end,

            -- Google Gemini
            gemini = function()
              return require("codecompanion.adapters").extend("gemini", {
                env = {
                  api_key = "GEMINI_API_KEY",
                },
                schema = {
                  model = {
                    default = "gemini-2.0-flash-exp",
                    choices = {
                      "gemini-2.0-flash-exp",
                      "gemini-2.0-flash-thinking-exp",
                      "gemini-exp-1206",
                      "gemini-1.5-pro",
                      "gemini-1.5-flash",
                    },
                  },
                },
              })
            end,

            -- xAI (Grok)
            xai = function()
              return require("codecompanion.adapters").extend("xai", {
                env = {
                  api_key = "XAI_API_KEY",
                },
                schema = {
                  model = {
                    default = "grok-2-1212",
                    choices = {
                      "grok-2-1212",
                      "grok-2-vision-1212",
                      "grok-beta",
                    },
                  },
                },
              })
            end,

            -- Agent Client Protocol adapters (CLI tools)
            claude_code = function()
              return require("codecompanion.adapters").extend("claude_code", {
                -- Claude Code CLI must be installed and in PATH
              })
            end,

            gemini_cli = function()
              return require("codecompanion.adapters").extend("gemini_cli", {
                -- Gemini CLI must be installed and in PATH
              })
            end,
          },
        },

        -- Display configuration
        display = {
          chat = {
            window = {
              layout = "vertical", -- vertical|horizontal|float
              width = 0.45,
              height = 0.85,
              relative = "editor",
              border = "rounded",
            },
          },
          diff = {
            provider = "mini_diff",
          },
        },

        -- Prompt library configuration
        prompt_library = {
          ["Explain"] = {
            strategy = "chat",
            description = "Explain how the selected code works",
            opts = {
              index = 1,
              is_slash_cmd = true,
            },
            prompts = {
              {
                role = "user",
                content = "Please explain how this code works:\n\n```{{filetype}}\n{{selection}}\n```",
              },
            },
          },
          ["Fix"] = {
            strategy = "chat",
            description = "Fix bugs in the selected code",
            opts = {
              index = 2,
              is_slash_cmd = true,
            },
            prompts = {
              {
                role = "user",
                content = "Please fix any bugs in this code:\n\n```{{filetype}}\n{{selection}}\n```",
              },
            },
          },
          ["Optimize"] = {
            strategy = "chat",
            description = "Optimize the selected code",
            opts = {
              index = 3,
              is_slash_cmd = true,
            },
            prompts = {
              {
                role = "user",
                content = "Please optimize this code for performance and readability:\n\n```{{filetype}}\n{{selection}}\n```",
              },
            },
          },
          ["Tests"] = {
            strategy = "chat",
            description = "Generate tests for the selected code",
            opts = {
              index = 4,
              is_slash_cmd = true,
            },
            prompts = {
              {
                role = "user",
                content = "Please write comprehensive tests for this code:\n\n```{{filetype}}\n{{selection}}\n```",
              },
            },
          },
          ["Refactor"] = {
            strategy = "chat",
            description = "Refactor the selected code",
            opts = {
              index = 5,
              is_slash_cmd = true,
            },
            prompts = {
              {
                role = "user",
                content = "Please refactor this code to improve maintainability:\n\n```{{filetype}}\n{{selection}}\n```",
              },
            },
          },
        },
      })

      -- Keybindings
      local keymap = vim.keymap.set

      -- AI prefix: <leader>a
      keymap("n", "<leader>a", "", { desc = "AI Assistant" })

      -- Chat
      keymap("n", "<leader>ac", "<cmd>CodeCompanionChat<cr>", { desc = "AI Chat" })
      keymap("v", "<leader>ac", "<cmd>CodeCompanionChat<cr>", { desc = "AI Chat (selection)" })
      keymap("n", "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle AI Chat" })

      -- Actions
      keymap("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
      keymap("v", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions (selection)" })

      -- Quick commands
      keymap("n", "<leader>ae", "<cmd>CodeCompanion /explain<cr>", { desc = "Explain code" })
      keymap("v", "<leader>ae", "<cmd>CodeCompanion /explain<cr>", { desc = "Explain selection" })

      keymap("n", "<leader>af", "<cmd>CodeCompanion /fix<cr>", { desc = "Fix bugs" })
      keymap("v", "<leader>af", "<cmd>CodeCompanion /fix<cr>", { desc = "Fix selection" })

      keymap("n", "<leader>ao", "<cmd>CodeCompanion /optimize<cr>", { desc = "Optimize code" })
      keymap("v", "<leader>ao", "<cmd>CodeCompanion /optimize<cr>", { desc = "Optimize selection" })

      keymap("n", "<leader>aT", "<cmd>CodeCompanion /tests<cr>", { desc = "Generate tests" })
      keymap("v", "<leader>aT", "<cmd>CodeCompanion /tests<cr>", { desc = "Generate tests" })

      keymap("n", "<leader>ar", "<cmd>CodeCompanion /refactor<cr>", { desc = "Refactor code" })
      keymap("v", "<leader>ar", "<cmd>CodeCompanion /refactor<cr>", { desc = "Refactor selection" })

      -- Inline completion (like GitHub Copilot)
      keymap("n", "<leader>ai", "<cmd>CodeCompanionInline<cr>", { desc = "Inline AI" })
      keymap("v", "<leader>ai", "<cmd>CodeCompanionInline<cr>", { desc = "Inline AI (selection)" })

      -- Model selection
      keymap("n", "<leader>am", function()
        vim.ui.select({
          "anthropic (Claude)",
          "gemini (Gemini)",
          "xai (Grok)",
          "claude_code (Agent)",
          "gemini_cli (Agent)",
        }, {
          prompt = "Select AI Model:",
        }, function(choice)
          if not choice then
            return
          end

          local adapter
          if choice:match("^anthropic") then
            adapter = "anthropic"
          elseif choice:match("^gemini %(Gemini%)") then
            adapter = "gemini"
          elseif choice:match("^xai") then
            adapter = "xai"
          elseif choice:match("^claude_code") then
            adapter = "claude_code"
          elseif choice:match("^gemini_cli") then
            adapter = "gemini_cli"
          end

          -- Update default adapter
          require("codecompanion").setup({
            strategies = {
              chat = { adapter = adapter },
              inline = { adapter = adapter },
            },
          })

          vim.notify("AI Model switched to: " .. adapter, vim.log.levels.INFO)
        end)
      end, { desc = "Select AI Model" })

      -- Add current buffer to chat context
      keymap("n", "<leader>ab", function()
        local bufnr = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(bufnr)
        vim.notify("Added to AI context: " .. vim.fn.fnamemodify(filename, ":t"), vim.log.levels.INFO)
      end, { desc = "Add buffer to AI context" })
    end,
  },
}

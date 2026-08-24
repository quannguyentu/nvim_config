return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- Optional: Close Neo-tree if it is the last window left in the tab
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and require("neo-tree.sources.manager").get_state("filesystem").path then
            vim.cmd("q")
          end
        end,
      })

      --KEYBINDS
      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree file explorer" })
      vim.keymap.set("n", "<leader>fe", "<cmd>Neotree filesystem reveal left<cr>", { desc = "Reveal file in Neo-tree" })
      vim.keymap.set("n", "<leader>be", "<cmd>Neotree buffers<cr>", { desc = "Open Neo-tree buffers" })
      vim.keymap.set("n", "<leader>ge", "<cmd>Neotree git_status<cr>", { desc = "Open Neo-tree git status" })

      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",

        -- 1. ENABLE GIT STATUS
        enable_git_status = true,
        enable_diagnostics = true,
        git_status_async = true, -- Crucial for performance and smooth rendering

        -- 2. CONFIGURE THE "SMALL" GIT STATUS SYMBOLS ON THE RIGHT
        default_component_configs = {
          git_status = {
            symbols = {
              -- You can change these to be smaller characters if you prefer (e.g., "+", "~", "-")
              added     = "",
              modified  = "",
              deleted   = "✖",
              renamed   = "➜",
              untracked = "★",
              ignored   = "◌",
              unstaged  = "✗",
              staged    = "✓",
              conflict  = "",
            },
            right_align = true,

          },
          -- Optional: You can also right-align diagnostics (LSP errors/warnings)
          diagnostics = {
            symbols = {
              hint = "",
              info = "",
              warn = "!",
              error = "✖",
            },
            right_align = true,
          },


        },

        git_status = {
          window = {
            position = "float",
          },
        },



        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = {
              "node_modules",
              ".git",
              "__pycache__",
            },
            never_show = {},
          },
          follow_current_file = {
            enabled = true, -- Highly recommended: auto-scrolls the tree to the file you are editing
            leave_dirs_open = false,
          },
          group_empty_dirs = false,
          use_libuv_file_watcher = true, -- Better file watching for external changes

          -- 3. RECOMMENDED KEYBINDS
          window = {
            mappings = {
              -- Navigation & Opening
              ["<space>"] = { "toggle_node", nowait = false, config = { show_hidden = true } },
              ["<2-LeftMouse>"] = "open",
              ["<cr>"] = "open",
              ["<esc>"] = "cancel",
              ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
              ["l"] = "focus_preview",
              ["S"] = "open_split",
              ["s"] = "open_vsplit",
              ["t"] = "open_tabnew",

              -- Integration with your nvim-window-picker plugin!
              ["w"] = "open_with_window_picker",

              -- Node Manipulation
              ["C"] = "close_node",
              ["z"] = "close_all_nodes",
              ["Z"] = "expand_all_nodes",
              ["a"] = { "add", config = { show_path = "none" } },
              ["A"] = "add_directory",
              ["d"] = "delete",
              ["r"] = "rename",
              ["y"] = "copy_to_clipboard",
              ["x"] = "cut_to_clipboard",
              ["p"] = "paste_from_clipboard",
              ["c"] = "copy",
              ["m"] = "move",

              -- Git & Help
              ["R"] = "refresh",
              ["?"] = "show_help",
              ["<"] = "prev_source",
              [">"] = "next_source",
              ["i"] = "show_file_details",
              ["q"] = "close_window",
            },
          },
        },

        -- Bonus: Buffers source config
        buffers = {
          follow_current_file = { enabled = true },
          group_empty_dirs = true,
          show_unloaded = true,
          window = { mappings = { ["bd"] = "buffer_delete" } },
        },
      })
    end,
  },
  {
    "Crysthamus/nvim-file-operations",
    -- branch = "compat" -- if you are on Neovim <= 0.10
    dependencies = {
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("nvim-file-operations").setup()
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
}

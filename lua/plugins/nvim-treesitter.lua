return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "main",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter").setup({
      -- List of parsers to always install/update on startup
      ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "javascript", "rust", "markdown", "markdown_inline" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      -- List of parsers to ignore installing (or "all")
      -- ignore_install = { "javascript" },

      ---- Modules ----
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },

      -- Text objects configuration
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@statement.inner",
            ["a="] = "@assignment.outer",
            ["i="] = "@assignment.inner",
            ["lhs"] = "@assignment.lhs",
            ["rhs"] = "@assignment.rhs",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
            ["]l"] = "@loop.outer",
            ["]i"] = "@conditional.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
            ["[l"] = "@loop.outer",
            ["[i"] = "@conditional.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sa"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>sA"] = "@parameter.inner",
          },
        },
      },
    })
  end,
}
